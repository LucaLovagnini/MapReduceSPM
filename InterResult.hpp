/*
 * InterValueResult.hpp
 *
 *  Created on: Dec 16, 2015
 *      Author: luca
 */

#include "Result.hpp"

#ifndef INTERVALUERESULT_HPP_
#define INTERVALUERESULT_HPP_

template <typename MIK, typename MIV, typename MOK, typename MOV>
class InterValueResult : public Result<MIK,MIV,MOK,MOV>{
public:
	void execute(TaskScheduler<MIK,MIV,MOK,MOV> *worker) {
		worker->completeInter();
	}
};

#endif /* INTERVALUERESULT_HPP_ */
