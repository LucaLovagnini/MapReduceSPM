#include <ff/pipeline.hpp> // defines ff_pipeline and ff_Pipe
#include <ff/farm.hpp>
#include <iostream>
#include <iterator>
#include <sstream>
#include <stdlib.h>
#include <time.h>

#include "MapReduceJob.hpp"

using namespace ff;

int main(int argc, char* argv[]) {
	int nWorkers = ff_realNumCores()-1;//-1 because one is TaskScheduler
	string fileName;
	switch (argc){
	case 3:
		nWorkers = atoi(argv[2]);
		/* no break */
	case 2:
		fileName = argv[1];
		break;
	default:
		cout<<"Error: bad arguments"<<endl;
		return 0;
	}
	if(argc>=2)
		fileName = argv[1];
	if(argc>=3)
		nWorkers = atoi(argv[2]);
	else {
	}
	cout<<"fileName="<<fileName<<" nWorkers="<<nWorkers<<endl;
	std::function<void(int key, string value,MapResult<int,string,string,int> *result)> map_func = [](int key,string value,MapResult<int,string,string,int> *result) {
	    istringstream iss(value);
	    vector<string> tokens{istream_iterator<string>{iss},istream_iterator<string>{}};
	    for(string key : tokens)
	    	result->emit(key,1);
	};
	std::function<pair<string,int> (string key, vector<int> list_value)> red_func = [](string key, vector<int> list_value){
		pair<string,int> result(key,list_value.size());
		return result;
	};
	MapReduceJob<int,string,string,int,string,int> job (fileName,map_func,red_func,nWorkers);
	return 0;
}
