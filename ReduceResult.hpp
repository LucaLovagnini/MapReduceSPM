/*
 * ReduceResult.hpp
 *
 *  Created on: Jan 9, 2016
 *      Author: luca
 */

#ifndef REDUCERESULT_HPP_
#define REDUCERESULT_HPP_

#include "Result.hpp"

template <typename MIK, typename MIV, typename MOK, typename MOV>
class ReduceResult : public Result<MIK,MIV,MOK,MOV>{
public:
	void execute(TaskScheduler<MIK,MIV,MOK,MOV> *taskScheduler) {
		taskScheduler->completeReduce();
	}
};


#endif /* REDUCERESULT_HPP_ */
