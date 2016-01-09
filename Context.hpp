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
	Context(MapReduceWorker<MIK,MIV,MOK,MOV> *worker, const unsigned short nWorkers) : worker(worker),nWorkers(nWorkers){
		inter_values = new vector<pair<MOK,MOV>>[nWorkers];
		for(int i=0;i<nWorkers;i++)
		    inter_values[i].reserve(SIZE);
	}

	void emit(MOK key, MOV value) {
		size_t h = worker->hash->operator()(key) ;
		const unsigned short red_worker = h % nWorkers;
		/*stringstream s;
		s<<"key="<<key<<" red_worker="<<red_worker<<endl;
		cout<<s.str();*/
		inter_values[red_worker].push_back({key,value});
		if(inter_values[red_worker].size()>=SIZE){
			sort_append_clear(red_worker);
		}
	}

	void flush(){
		cout<<"flushing"<<endl;
		for(int i=0;i<nWorkers;i++)
			if(!inter_values[i].empty())
				sort_append_clear(i);
	}

	bool pairCompare(const std::pair<MOK, MOV>& firstElem, const std::pair<MOK, MOV>& secondElem) {
	  return firstElem.first < secondElem.first;
	}

	void sort_append_clear(const unsigned short red_worker){
		stringstream s;
		/*sort(inter_values[red_worker].begin(),inter_values[red_worker].end(),[]( const std::pair<MOK,MOV> &left,  const std::pair<MOK,MOV> &right) {
		    return left.second < right.second;
		});*/
		//worker->all_mtx[red_worker].lock();
	    if (worker->all_inter_values[red_worker].empty())
	        worker->all_inter_values[red_worker] = move(inter_values[red_worker]);
	    else{
	        //worker->all_inter_values[red_worker].reserve(worker->all_inter_values[red_worker].size() + inter_values[red_worker].size());
	        move(begin(inter_values[red_worker]), end(inter_values[red_worker]), back_inserter(worker->all_inter_values[red_worker]));
	    }
		//worker->all_mtx[red_worker].unlock();
	    inter_values[red_worker].clear();
	    inter_values[red_worker].reserve(SIZE);
	}
private:
	vector<pair<MOK,MOV>> *inter_values;
	MapReduceWorker<MIK,MIV,MOK,MOV> *worker;
	const unsigned short nWorkers;

};

#endif /* CONTEXT_HPP_ */
