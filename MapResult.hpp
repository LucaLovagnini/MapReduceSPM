/*
 * MapResult.h
 *
 *  Created on: Dec 6, 2015
 *      Author: luca
 */
#include <iostream>
#include <stdlib.h>
#include "InterTask.hpp"

using namespace std;

#ifndef MAPRESULT_H_
#define MAPRESULT_H_

template <typename MIK, typename MIV, typename MOK, typename MOV>
class MapResult : public Result<MIK,MIV,MOK,MOV>{
public:
	MapResult(const unsigned short red_worker, vector<pair<MOK,MOV>> *res) : red_worker(red_worker), res(res), flush_res(NULL){}
	MapResult(vector<pair<MOK,MOV>> **flush_res) : red_worker(-1), res(NULL), flush_res(flush_res){}
	void execute(TaskScheduler<MIK,MIV,MOK,MOV> *taskScheduler) {
		if(res!=NULL){
			/*cout<<"MapResult res pairs:"<<endl;
			for(pair<MOK,MOV> p : *res)
				cout<<"key= "<<p.first<<" value="<<p.second<<endl;*/
			send_intertask(res,taskScheduler,red_worker);
		}
		else{
			//cout<<"FLUSH RESULT"<<endl;
			for(int i=0; i<taskScheduler->nWorkers; i++){
				/*cout<<"Printing flushed pairs for reducer "<<i<<endl;
				for(pair<MOK,MOV> p : *res)
					cout<<"key= "<<p.first<<" value="<<p.second<<endl;*/
				send_intertask(flush_res[i], taskScheduler, i);
			}
			taskScheduler->completeMap();
		}
	    delete this;
	}
private:
	void send_intertask(vector<pair<MOK,MOV>> *res, TaskScheduler<MIK,MIV,MOK,MOV> *taskScheduler, const unsigned short red_worker){
		if(res->size()>0){
			taskScheduler->newInter();
			InterValueTask<MIK,MIV,MOK,MOV> *inter_task = new InterValueTask<MIK,MIV,MOK,MOV>(res);
			taskScheduler->lb->ff_send_out_to(inter_task,red_worker);
		}
	}
	const unsigned short red_worker;
	vector<pair<MOK,MOV>> *res;
	vector<pair<MOK,MOV>> **flush_res;
};

#endif /* MAPRESULT_H_ */
