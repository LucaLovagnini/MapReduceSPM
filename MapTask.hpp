/*
 * MapTask.hpp
 *
 *  Created on: Dec 14, 2015
 *      Author: luca
 */

#include "Task.hpp"
#include "Context.hpp"
#include "boost/date_time/posix_time/posix_time.hpp"

typedef boost::posix_time::ptime Time;
typedef boost::posix_time::time_duration TimeDuration;

using namespace std;

#ifndef MAPTASK_HPP_
#define MAPTASK_HPP_

template <typename MIK, typename MIV, typename MOK, typename MOV>
struct MapTask : public Task<MIK,MIV,MOK,MOV> {
public:
	MapTask(RecordReader<MIK,MIV> *record_reader, pair<off_t,off_t> split, function<void(MIK key, MIV value, Context<MIK,MIV,MOK,MOV> *context)> map_func, unsigned const short nWorkers) :
		map_func(map_func),nWorkers(nWorkers){
		this->record_reader = record_reader;//this is a clone! (look at new MapTask in TaskScheduler.hpp)
		this->record_reader->initialize(split);
	}
	void execute (MapReduceWorker<MIK,MIV,MOK,MOV> *worker){
		Context<MIK,MIV,MOK,MOV> *context = new Context<MIK,MIV,MOK,MOV>(worker,nWorkers);
		while(record_reader->isMorePairs()) {
			record_reader->getNextKeyValue();
		    //print elapsed seconds (with millisecond precision)
			MIK key = record_reader->getCurrentKey();
			MIV value = record_reader->getCurrentValue();
			map_func(key, value, context);
		}
		context->flush();
	}
private:
	unsigned const short nWorkers;
	pair<off_t,off_t> split;
	function<void(MIK key, MIV value, Context<MIK,MIV,MOK,MOV> *context)> map_func;
	RecordReader<MIK,MIV> *record_reader;
};



#endif /* MAPTASK_HPP_ */
