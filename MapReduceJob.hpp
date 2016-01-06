/*
 * mrTask.hpp
 *
 *  Created on: Dec 3, 2015
 *      Author: luca
 */

#ifndef MAPREDUCEJOB_HPP_
#define MAPREDUCEJOB_HPP_

#include <ff/farm.hpp>
#include "TaskScheduler.hpp"
#include "MapReduceWorker.hpp"
#include "MapResult.hpp"
#include "TextInputFormat.hpp"
#include "LineRecordReader.hpp"
#include "MapReduceJob.hpp"
#include "MapReduceHash.hpp"
#include "TaskScheduler.hpp"
#include "boost/date_time/posix_time/posix_time.hpp"

using namespace ff;

typedef boost::posix_time::ptime Time;
typedef boost::posix_time::time_duration TimeDuration;

/*
 * MIK: map input key
 * MIV: map input value
 * MOK: map output key
 * MOV: map output value
 * RK: reduce output key
 * RV: reduce output value
 */
template<typename MIK, typename MIV, typename MOK, typename MOV, typename RK, typename RV>
class MapReduceJob {
public:
	MapReduceJob(	string file_name,
					function<void(MIK key, MIV value, Context<MIK,MIV,MOK,MOV>*)> map_func ,
					function<pair<RK,RV> (MOK key, vector<MOV> list_value)> red_func,
					unsigned const short nWorkers) : nWorkers(nWorkers) , myhash(new MapReduceHash<MOK>()){
		farm = new ff_Farm<> ( [this]() {
		  std::vector<std::unique_ptr<ff_node> > Workers;
			for(int i=0;i<this->nWorkers;++i)
				Workers.push_back(std::unique_ptr<ff_node_t<Task<MIK,MIV,MOK,MOV>,Result<MIK,MIV,MOK,MOV>> >(new MapReduceWorker<MIK,MIV,MOK,MOV>(this->myhash)));
		  return Workers;
		}() );
		task_scheduler = new TaskScheduler<MIK,MIV,MOK,MOV> (farm->getlb(),file_name,nWorkers,map_func);
		farm->remove_collector(); // removes the default collector
		farm->add_emitter(*task_scheduler);
		farm->wrap_around();
	}
	MapReduceJob(	string file_name,
					function<void(MIK key, MIV value, MapResult<MIK,MIV,MOK,MOV>*)> map_func ,
					function<pair<RK,RV> (MOK key, vector<MOV> list_value)> red_func)
		: MapReduceJob (file_name, map_func, red_func, ff_realNumCores()){}
	void waitForCompletion(){
	    Time t1(boost::posix_time::microsec_clock::local_time());
		if (farm->run_and_wait_end()<0) error("running myFarm");
	    Time t2(boost::posix_time::microsec_clock::local_time());
	    TimeDuration dt = t2 - t1;
	    //number of elapsed miliseconds
	    long msec = dt.total_milliseconds();
	    //print elapsed seconds (with millisecond precision)
	    std::cout << msec/1000.0 <<endl;
	    ofstream myfile ("test.ods", ios::out | ios::app);
	    if(myfile.is_open()){
	    	myfile<<nWorkers<<"\t"<<msec/1000.0<<endl;
	    	myfile.close();
	    }
	}
	void setRecordReader (RecordReader<MIK,MIV> *record_reader) {
		task_scheduler->setRecordReader(record_reader);
	}
	void setInputFormat (InputFormat *inputFormat){
		task_scheduler->setInputFormat(inputFormat);
	}
	void setHash (MapReduceHash<MOK> hash){
		*myhash = hash;
	}

private:
	ff_Farm<> *farm;
	TaskScheduler<MIK,MIV,MOK,MOV> *task_scheduler;
	MapReduceHash<MOK> *myhash;
	unsigned const short nWorkers;

};

#endif /* MAPREDUCEJOB_HPP_ */
