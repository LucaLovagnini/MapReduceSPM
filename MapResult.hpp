/*
 * MapResult.h
 *
 *  Created on: Dec 6, 2015
 *      Author: luca
 */
#include <iostream>
#include <stdlib.h>
#include <deque>

using namespace std;

#ifndef MAPRESULT_H_
#define MAPRESULT_H_

template <typename MIK, typename MIV, typename MOK, typename MOV>
class MapResult : public Result<MIK,MIV,MOK,MOV>{
public:
	void execute(TaskScheduler<MIK,MIV,MOK,MOV> *taskScheduler) {
	    taskScheduler->completeMap();
	    delete this;
	}
	void emit(MOK key, MOV value) {
		//cout<<"key="<<key<<" value="<<value<<endl;
		res.push_back(pair<MOK,MOV>(key,value));
	}
	vector<pair<MOK,MOV>> res;
};

#endif /* MAPRESULT_H_ */
