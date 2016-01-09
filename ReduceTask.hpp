/*
 * ReduceTask.hpp
 *
 *  Created on: Jan 9, 2016
 *      Author: luca
 */

#ifndef REDUCETASK_HPP_
#define REDUCETASK_HPP_

#include "Task.hpp"

template <typename MIK, typename MIV, typename MOK, typename MOV>
struct ReduceTask : public Task<MIK,MIV,MOK,MOV> {
	void execute (MapReduceWorker<MIK,MIV,MOK,MOV> *worker){
		/*stringstream s;
		s<<"PRINTING PAIRS OF WOKRER "<<worker->id<<endl;
		for(pair<MOK,MOV> p : worker->all_inter_values[worker->id])
			s<<"key="<<p.first<<" value="<<p.second<<endl;
		cout<<s.str();*/
		worker->ff_send_out(new ReduceResult<MIK,MIV,MOK,MOV>());
	}
};



#endif /* REDUCETASK_HPP_ */
