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
	InputFormat(const string& file_name, unsigned const short nWorkers) : nWorkers(nWorkers), file_name(file_name) {}
	virtual pair<off_t,off_t>* getSplits() = 0;
	virtual ~InputFormat(){}
public:
	const string& file_name;
	const unsigned short nWorkers;
};

#endif /* INPUTFORMAT_HPP_ */
