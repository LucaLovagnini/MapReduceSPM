/*
 * MapTask.hpp
 *
 *  Created on: Dec 14, 2015
 *      Author: luca
 */

#include "Task.hpp"
#include "boost/date_time/posix_time/posix_time.hpp"

typedef boost::posix_time::ptime Time;
typedef boost::posix_time::time_duration TimeDuration;

using namespace std;

#ifndef MAPTASK_HPP_
#define MAPTASK_HPP_

template <typename MIK, typename MIV, typename MOK, typename MOV>
struct MapTask : public Task<MIK,MIV,MOK,MOV> {
public:
	MapTask(RecordReader<MIK,MIV> *record_reader, pair<off_t,off_t> split, function<void(MIK key, MIV value, MapResult<MIK,MIV,MOK,MOV> *result)> map_func) : map_func(map_func){
		this->record_reader = record_reader;//this is a clone! (look at new MapTask in TaskScheduler.hpp)
		this->record_reader->initialize(split);
	}
	Result<MIK,MIV,MOK,MOV> *execute (MapReduceWorker<MIK,MIV,MOK,MOV> *worker){
		MapResult<MIK,MIV,MOK,MOV> *result = new MapResult<MIK,MIV,MOK,MOV>();
	    Time t1(boost::posix_time::microsec_clock::local_time());
		while(record_reader->isMorePairs()) {
			record_reader->getNextKeyValue();
			MIK key = record_reader->getCurrentKey();
			MIV value = record_reader->getCurrentValue();
			map_func(key, value, result);
		}
	    Time t2(boost::posix_time::microsec_clock::local_time());
	    TimeDuration dt = t2 - t1;
	    //number of elapsed miliseconds
	    long msec = dt.total_milliseconds();
	    //print elapsed seconds (with millisecond precision)
		return result;
	}
private:
	pair<off_t,off_t> split;
	function<void(MIK key, MIV value, MapResult<MIK,MIV,MOK,MOV> *result)> map_func;
	RecordReader<MIK,MIV> *record_reader;
};



#endif /* MAPTASK_HPP_ */
