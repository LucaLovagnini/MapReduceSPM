/*
 * IntermediateResultTask.hpp
 *
 *  Created on: Dec 16, 2015
 *      Author: luca
 */

#include <unordered_map>

#include "InterResult.hpp"
#include "Task.hpp"

#ifndef INTERMEDIATERESULTTASK_HPP_
#define INTERMEDIATERESULTTASK_HPP_

template <typename MIK, typename MIV, typename MOK, typename MOV>
class InterValueTask : public Task<MIK,MIV,MOK,MOV> {
public:
	InterValueTask (unordered_multimap<MOK,MOV> inter_values) : inter_values(inter_values) {}
	Result<MIK,MIV,MOK,MOV> *execute(MapReduceWorker<MIK,MIV,MOK,MOV> *worker){
		merge(worker->inter_values.begin(),worker->inter_values.end(),inter_values.begin(),inter_values.end(),inserter(worker->inter_values,end(worker->inter_values)));
		return new InterValueResult<MIK,MIV,MOK,MOV>();
	}
private:
	unordered_multimap<MOK,MOV> inter_values;
};



#endif /* INTERMEDIATERESULTTASK_HPP_ */
