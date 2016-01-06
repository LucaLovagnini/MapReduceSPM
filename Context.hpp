/*
 * Context.hpp
 *
 *  Created on: Jan 3, 2016
 *      Author: luca
 */

#ifndef CONTEXT_HPP_
#define CONTEXT_HPP_

#define SIZE 4

#include <array>
#include "MapReduceWorker.hpp"

template <typename MIK, typename MIV, typename MOK, typename MOV>
class Context{
public:
	Context(MapReduceWorker<MIK,MIV,MOK,MOV> *worker, const unsigned short nWorkers) : worker(worker),nWorkers(nWorkers){
		inter_values = new vector<pair<MOK,MOV>>*[nWorkers];
		for(int i =0;i<nWorkers;i++)
			inter_values[i] = new_and_reserve();
	}

	void emit(MOK key, MOV value) {
		size_t h = worker->hash->operator()(key) ;
		const unsigned short red_worker = h % nWorkers;
		vector<pair<MOK,MOV>> *pairs = inter_values[red_worker];
		stringstream s;
		cout<<s.str();
		pairs->push_back({key,value});
		if(pairs->size()>=SIZE){
			sort(pairs->begin(),pairs->end(),[](pair<MOK,MOV> i,pair<MOK,MOV> j) { return (i.first<j.first); });
			MapResult<MIK,MIV,MOK,MOV> *result = new MapResult<MIK,MIV,MOK,MOV>(red_worker,pairs);
			worker->ff_send_out(result);
			inter_values[red_worker] = new_and_reserve();
		}
	}
	void flush(){
		MapResult<MIK,MIV,MOK,MOV> *result = new MapResult<MIK,MIV,MOK,MOV>(inter_values);
		worker->ff_send_out(result);
	}
private:
	vector<pair<MOK,MOV>>* new_and_reserve(){
		vector<pair<MOK,MOV>> *v = new vector<pair<MOK,MOV>>();
		v->reserve(SIZE);
		return v;
	}
	vector<pair<MOK,MOV>> **inter_values;
	MapReduceWorker<MIK,MIV,MOK,MOV> *worker;
	const unsigned short nWorkers;

};

#endif /* CONTEXT_HPP_ */
