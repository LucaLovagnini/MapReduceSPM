/*
 * Context.hpp
 *
 *  Created on: Jan 3, 2016
 *      Author: luca
 */

#ifndef CONTEXT_HPP_
#define CONTEXT_HPP_

#define SIZE 128

#include <array>
#include "MapReduceWorker.hpp"



template <typename MIK, typename MIV, typename MOK, typename MOV>
class Context{
public:
	Context(MapReduceWorker<MIK,MIV,MOK,MOV> *worker, const unsigned short nWorkers) : worker(worker),nWorkers(nWorkers){}

	void emit(MOK key, MOV value) {
		size_t h = worker->hash->operator()(key) ;
		const unsigned short red_worker = h % nWorkers;
		/*stringstream s;
		s<<"key="<<key<<" red_worker="<<red_worker<<endl;
		cout<<s.str();*/
		worker->inter_values[worker->id][red_worker].push_back({key,value});
	}
private:
	MapReduceWorker<MIK,MIV,MOK,MOV> *worker;
	const unsigned short nWorkers;

};

#endif /* CONTEXT_HPP_ */
