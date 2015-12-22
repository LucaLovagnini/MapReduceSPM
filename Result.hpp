/*
 * Result.h
 *
 *  Created on: Dec 6, 2015
 *      Author: luca
 */

#include "MapReduceWorker.hpp"

#ifndef RESULT_HPP_
#define RESULT_HPP_

template <typename MIK, typename MIV, typename MOK, typename MOV>
struct Result {
public:
	virtual void execute(TaskScheduler<MIK,MIV,MOK,MOV> *worker) = 0;
	virtual ~Result(){}
};

#endif /* RESULT_HPP_ */
