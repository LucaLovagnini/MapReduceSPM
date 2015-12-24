/*
 * MapTask.hpp
 *
 *  Created on: Dec 14, 2015
 *      Author: luca
 */

#include "Task.hpp"
#include <ff/pipeline.hpp> // defines ff_pipeline and ff_Pipe

using namespace ff;
using namespace std;

#ifndef MAPTASK_HPP_
#define MAPTASK_HPP_

typedef long myTask;  // this is my input/output type

template <typename MIK, typename MIV, typename MOK, typename MOV>
struct MapTask : public Task<MIK,MIV,MOK,MOV> {
public:

	struct RecordGenerator: ff_node_t<pair<MIK,MIV>> {  // 1st stage
		RecordGenerator(RecordReader<MIK,MIV> *record_reader) : record_reader(record_reader){}
		pair<MIK,MIV> *svc(pair<MIK,MIV>*) {
			while(record_reader->isMorePairs()){
				record_reader->getNextKeyValue();
				MIK key = record_reader->getCurrentKey();
				MIV value = record_reader->getCurrentValue();
				return new pair<MIK,MIV>(key,value);
			}
			return (pair<MIK,MIV>*) EOS; // End-Of-Stream
	    }
		RecordReader<MIK,MIV> *record_reader;
	};
	struct Mapper : ff_node_t<pair<MIK,MIV>> {
		Mapper(MapResult<MIK,MIV,MOK,MOV> *result, 	function<void(MIK key, MIV value, MapResult<MIK,MIV,MOK,MOV> *result)> map_func)
				: result(result) , map_func(map_func){}
		pair<MIK,MIV> *svc(pair<MIK,MIV> *task) {
			map_func(task->first,task->second,result);
			delete task;
			return task;
		}
		MapResult<MIK,MIV,MOK,MOV> *result;
		function<void(MIK key, MIV value, MapResult<MIK,MIV,MOK,MOV> *result)> map_func;
	};

	MapTask(RecordReader<MIK,MIV> *record_reader, pair<off_t,off_t> split, function<void(MIK key, MIV value, MapResult<MIK,MIV,MOK,MOV> *result)> map_func) : map_func(map_func){
		this->record_reader = record_reader;//this is a clone! (look at new MapTask in TaskScheduler.hpp)
		this->record_reader->initialize(split);
	}
	Result<MIK,MIV,MOK,MOV> *execute (MapReduceWorker<MIK,MIV,MOK,MOV> *worker){
		MapResult<MIK,MIV,MOK,MOV> *result = new MapResult<MIK,MIV,MOK,MOV>();
		Mapper mapper(result,map_func);
		RecordGenerator record_generator(record_reader);
		ff_Pipe<> pipe(record_generator , mapper);
		if (pipe.run_and_wait_end()<0) error("running pipe");
		return result;
	}
private:
	pair<off_t,off_t> split;
	function<void(MIK key, MIV value, MapResult<MIK,MIV,MOK,MOV> *result)> map_func;
	RecordReader<MIK,MIV> *record_reader;
};



#endif /* MAPTASK_HPP_ */
