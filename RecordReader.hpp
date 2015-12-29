/*
 * RecordReader.hpp
 *
 *  Created on: Dec 8, 2015
 *      Author: luca
 */

#include <iostream>
#include <fstream>

using namespace std;

#ifndef RECORDREADER_HPP_
#define RECORDREADER_HPP_

/**
 * Generates (key,values) pairs.
 */
template <typename MIK,typename MIV>
class RecordReader{
public:
	RecordReader(const string &file_name) : file_name(file_name){
		ifs.open(file_name);
	}
	void initialize (pair<off_t,off_t> split) {
		pos = split.first;
		end = split.second;
	}
	bool isMorePairs(){ return morePairs; }
	virtual MIK getCurrentKey()=0;
	virtual MIV getCurrentValue()=0;
	virtual void getNextKeyValue()=0;
	virtual RecordReader<MIK,MIV>* clone() = 0;
	virtual ~RecordReader(){};
protected:
	off_t pos=-1, end=-1;
	bool morePairs = true;
	ifstream ifs;
	string file_name;
};



#endif /* RECORDREADER_HPP_ */
