/*
 * LineRecordReader.hpp
 *
 *  Created on: Dec 11, 2015
 *      Author: luca
 */

#include "RecordReader.hpp"
using namespace std;

#ifndef TEXTSPLITRECORDREADER_HPP_
#define TEXTSPLITRECORDREADER_HPP_

class  TextSplitRecordReader : public RecordReader<int,string>{
public:
	TextSplitRecordReader(const string &file_name) : RecordReader(file_name){}
	int getCurrentKey() { return key; }
	string getCurrentValue() { return value; }
	void getNextKeyValue() {
		key = pos;//value is the actual file offset
	    value.resize(end-pos+1);
	    ifs.read(&value[0], value.size());
	    ifs.close();
		morePairs = false;
	}
	RecordReader<int,string>* clone(){
		return new TextSplitRecordReader(file_name);
	}
private:
	off_t key = -1;
	string value;
};



#endif /* TEXTSPLITRECORDREADER_HPP_ */
