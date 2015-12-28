/*
 * LineRecordReader.hpp
 *
 *  Created on: Dec 11, 2015
 *      Author: luca
 */

#include "RecordReader.hpp"
using namespace std;

#ifndef LINERECORDREADER_HPP_
#define LINERECORDREADER_HPP_

class  LineRecordReader : public RecordReader<int,string>{
public:
	LineRecordReader(const string &file_name) : RecordReader(file_name){}
	int getCurrentKey() { return key; }
	string getCurrentValue() { return value; }
	void getNextKeyValue() {
		key = pos;//value is the actual file offset
		morePairs = getline(ifs,value);//save line as value. no more pairs if EOF...
		if(value.size()+pos>end) {
			morePairs= false;
			value = value.substr(0,end-pos+1);
		}
		pos += value.size()+1;
		morePairs = morePairs && pos <= end;//...or if we have reached the split's end
	}
	RecordReader<int,string>* clone(){
		return new LineRecordReader(file_name);
	}
private:
	off_t key = -1;
	string value;
};



#endif /* LINERECORDREADER_HPP_ */
