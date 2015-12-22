/*
 * InputFormat.hpp
 *
 *  Created on: Dec 9, 2015
 *      Author: luca
 */
#include <iostream>

using namespace std;

#ifndef INPUTFORMAT_HPP_
#define INPUTFORMAT_HPP_

/**
 * Generate splits. Used by TaskScheduler.
 */
class InputFormat {
public:
	InputFormat(string file_name, int nWorkers) : file_name(file_name), nWorkers(nWorkers){}
	virtual pair<off_t,off_t>* getSplits() = 0;
	virtual ~InputFormat(){}
public:
	string file_name;
	int nWorkers;
};

#endif /* INPUTFORMAT_HPP_ */
