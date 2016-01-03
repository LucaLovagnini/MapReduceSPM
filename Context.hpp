/*
 * Context.hpp
 *
 *  Created on: Jan 3, 2016
 *      Author: luca
 */

#ifndef CONTEXT_HPP_
#define CONTEXT_HPP_

#include <array>
#include "MapReduceWorker.hpp"


template <typename MIK, typename MIV, typename MOK, typename MOV>
class Context{
public:
	Context(MapReduceWorker<MIK,MIV,MOK,MOV> *worker, unsigned const short nWorkeres) : worker(worker),nWorkers(nWorkers){
		inter_values = new vector<pair<MIK,MIV>>[nWorkers];
	}

	void emit(MOK key, MOV value) {
		unsigned const short red_worker = mik_hash(key) % nWorkers;
		inter_values[red_worker].push_back({key,value});
	}
private:
	vector<pair<MIK,MIV>> *inter_values;
	MapReduceWorker<MIK,MIV,MOK,MOV> *worker;
	hash<MIK> mik_hash;
	unsigned const short nWorkers;

};

#endif /* CONTEXT_HPP_ */
