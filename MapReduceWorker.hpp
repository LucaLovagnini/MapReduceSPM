/*
 * MapReduceWorker.hpp
 *
 *  Created on: Dec 8, 2015
 *      Author: luca
 */

#include <ff/farm.hpp>
#include <mutex>
#include <algorithm>
#include "MapReduceHash.hpp"

using namespace std;
using namespace ff;

#ifndef MAPREDUCEWORKER_HPP_
#define MAPREDUCEWORKER_HPP_

template <typename MIK, typename MIV, typename MOK, typename MOV> struct Task;
template <typename MIK, typename MIV, typename MOK, typename MOV> struct Result;
template <typename MIK, typename MIV, typename MOK, typename MOV> struct TaskScheduler;

template <typename MIK, typename MIV, typename MOK, typename MOV>
struct MapReduceWorker: ff::ff_node_t <Task<MIK,MIV,MOK,MOV>,Result<MIK,MIV,MOK,MOV>>
{
	MapReduceWorker(MapReduceHash<MOK> *hash,vector<pair<MOK,MOV>> **inter_values, mutex *mtx)
			: id(this->get_my_id()), hash(hash),inter_values(inter_values),mtx(mtx){}
	Result<MIK,MIV,MOK,MOV> *svc(Task<MIK,MIV,MOK,MOV> *task) {
		task->execute(this);
		return (Result<MIK,MIV,MOK,MOV>*) GO_ON;
	}
	int svc_init(){
		id = this->get_my_id();
		return 0;
	}

	int id;
	vector<pair<MOK,MOV>> **inter_values;
	mutex *mtx;
	MapReduceHash<MOK> *hash;
};

#endif /* MAPREDUCEWORKER_HPP_ */
