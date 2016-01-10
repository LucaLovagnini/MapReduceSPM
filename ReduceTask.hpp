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
	ReduceTask(const unsigned short nWorkers ) : nWorkers(nWorkers) {}
	void execute (MapReduceWorker<MIK,MIV,MOK,MOV> *worker){
		/*stringstream s;
		s<<"PRINTING PAIRS OF WOKRER "<<worker->id<<endl;
		for(int i=0;i<1;i++){
			s<<"BEFORE"<<endl;
			for(pair<MOK,MOV> p : worker->inter_values[i][worker->id])
				s<<"key="<<p.first<<" value="<<p.second<<endl;
			sort(worker->inter_values[i][worker->id].begin(),worker->inter_values[i][worker->id].end(),compare);
			s<<"AFTER"<<endl;
			for(pair<MOK,MOV> p : worker->inter_values[i][worker->id])
				s<<"key="<<p.first<<" value="<<p.second<<endl;
		}
		cout<<s.str();*/
		for(int i=0;i<nWorkers;i++)
			sort(worker->inter_values[i][worker->id].begin(),worker->inter_values[i][worker->id].end(),compare);
		worker->ff_send_out(new ReduceResult<MIK,MIV,MOK,MOV>());
	}
	static bool compare(const pair<MOK,MOV>& f , const pair<MOK,MOV>& s){
    	return f.first<s.first;
	}
private :
	const unsigned short nWorkers;

};



#endif /* REDUCETASK_HPP_ */
