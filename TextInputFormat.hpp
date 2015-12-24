/*
 * InputFormat.hpp
 *
 *  Created on: Dec 9, 2015
 *      Author: luca
 */

#include <iostream>
#include <fstream>
#include <sys/stat.h>
#include <ff/parallel_for.hpp>
#include <math.h>
#include "InputFormat.hpp"

using namespace std;

#ifndef TEXTINPUTFORMAT_HPP_
#define TEXTINPUTFORMAT_HPP_

class TextInputFormat : public InputFormat {
public:
	TextInputFormat(const string& file_name, unsigned const short nWorkers) : InputFormat(file_name,nWorkers){}
	pair<off_t,off_t>* getSplits() {
		struct stat st;
		off_t size;
		if (stat(file_name.c_str(), &st) == 0)
			size = st.st_size;
		int nMappers = size > nWorkers ? nWorkers : size; //if workers are greater than file size
		pair<off_t,off_t> *splits = new pair<off_t,off_t> [nMappers];
		double split_size = (double) size / nMappers;
		off_t acc = 0 ;
		ff::ParallelFor pf( ff_realNumCores() );

		string prova = file_name;
		pf.parallel_for(0,nMappers,[&splits,split_size, prova, size](const long i) {
			ifstream ifs (prova , ifstream::in);
			off_t begin = ceil((double) i*split_size);
			off_t end = ceil((double) (i+1)*split_size-1);
			char c;
			string s;
			if(begin>0){
				//if char before the first one is different from ' ' or '\n'
				//then the split begins in the middle of a word (bad)
				ifs.seekg(begin-1,ios::beg);
				ifs.get(c);
				if(c!=' ' && c!='\n'){
					getline(ifs,s,' ');
					begin+=s.length();
				}
				if(begin>end)
					end=begin;
			}
			ifs.seekg(end,ios::beg);
			ifs.get(c);
			if(c!=' ' && c!='\n' && end != size){
				getline(ifs,s,' ');
				end+=s.length();
			}
			splits[i] = {begin, end};
		});
		return splits;
	}
};

#endif /* INPUTFORMAT_HPP_ */
