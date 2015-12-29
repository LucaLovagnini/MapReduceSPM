/*
 * LineRecordReader.hpp
 *
 *  Created on: Dec 11, 2015
 *      Author: luca
 */

#include "RecordReader.hpp"
using namespace std;

#include <sys/mman.h>
#include <sys/types.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#include <assert.h>

#include <boost/iostreams/device/mapped_file.hpp>


#define MMAP 1

#ifndef TEXTSPLITRECORDREADER_HPP_
#define TEXTSPLITRECORDREADER_HPP_

class  TextSplitRecordReader : public RecordReader<int,char*>{
public:
	TextSplitRecordReader(const string &file_name) : RecordReader(file_name) , value(NULL){
		fd = open(file_name.c_str(), O_RDONLY);
	    if(fd == -1)
	    	throw invalid_argument("File "+file_name+" doesn't exists");
	}
	int getCurrentKey() { return key; }
	char* getCurrentValue() { return value; }
	void getNextKeyValue() {
		key = pos;//value is the actual file offset
		value = new char[end-pos+1L];
	    /*off_t pa_offset = pos & ~(sysconf(_SC_PAGE_SIZE) - 1);
	    cout<<"pa_offset="<<pa_offset<<endl;
	    value = (char*) mmap(NULL, end-pos-pa_offset, PROT_READ, MAP_PRIVATE , fd, pa_offset);
	    if(value==MAP_FAILED)
	    	throw ios_base::failure("bad mmap");
	    value += pos-pa_offset;*/
	    ssize_t result = pread(fd, value, end-pos+1L, pos);
	    assert(result == ( end-pos+1L ) );
	    //cout<<"value="<<value<<endl;
		morePairs = false;
	}
	RecordReader<int,char*>* clone(){
		return new TextSplitRecordReader(file_name);
	}
private:
	int fd;
	off_t key = -1;
	char *value;
};



#endif /* TEXTSPLITRECORDREADER_HPP_ */
