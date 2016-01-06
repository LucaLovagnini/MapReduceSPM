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
	InterValueTask (vector<pair<MOK,MOV>> *res) : res(res) {}
	void execute(MapReduceWorker<MIK,MIV,MOK,MOV> *worker){
		stringstream s;
		s<<"INTERVALUE TASK WORKER "<<worker->get_my_id()<<endl;
		for(pair<MOK,MOV> p : *res){
			s<<"key = "<<p.first<<" value="<<p.second<<endl;
		}
		cout<<s.str();
		worker->ff_send_out(new InterValueResult<MIK,MIV,MOK,MOV>());
	}
private:
	vector<pair<MOK,MOV>> *res;
};



#endif /* INTERMEDIATERESULTTASK_HPP_ */
