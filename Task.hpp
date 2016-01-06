/*
 * task.hpp
 *
 *  Created on: Dec 6, 2015
 *      Author: luca
 */

#include "RecordReader.hpp"
#include "MapReduceWorker.hpp"

#ifndef TASK_HPP_
#define TASK_HPP_

template <typename MIK, typename MIV, typename MOK, typename MOV>
struct Task {
public:
	virtual void execute (MapReduceWorker<MIK,MIV,MOK,MOV> *worker) = 0;
	virtual ~Task<MIK,MIV,MOK,MOV>(){}
};

#endif /* TASK_HPP_ */
