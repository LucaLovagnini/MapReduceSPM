#include <ff/pipeline.hpp> // defines ff_pipeline and ff_Pipe
#include <ff/farm.hpp>
#include <iostream>
#include <iterator>
#include <sstream>
#include <stdlib.h>
#include <time.h>
#include <string.h>

#include "MapReduceHash.hpp"
#include "MapReduceJob.hpp"

#define WORDS 1

using namespace ff;

template <>
struct MapReduceHash<char *>
{
  std::size_t
  operator()(const char *const s) const noexcept
  {
    return hash_bytes(s, std::strlen(s));
  }
};

int main(int argc, char* argv[]) {
	std::hash<string> str_hash;
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
	std::function<void(int key, char *value,Context<int,char*,char*,int> *context)> map_func = [](int key,char *value,Context<int,char*,char*,int> *context) {
		const char delimit[]=" \t\r\n\v\f";
		char *token , *save;
		token = strtok_r(value, delimit, &save);
		while (token != NULL){
			context->emit(token,1);
			token = strtok_r (NULL,delimit, &save);
		}
	};
	std::function<pair<char*,int> (char* key, vector<int> list_value)> red_func = [](char* key, vector<int> list_value){
		pair<char*,int> result(key,list_value.size());
		return result;
	};

	MapReduceJob<int,char*,char*,int,char*,int> job (fileName,map_func,red_func,nWorkers);
	MapReduceHash<char*> hash;
	job.setHash(hash);
	job.waitForCompletion();
	return 0;
}
