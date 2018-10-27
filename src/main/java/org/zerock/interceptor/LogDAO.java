package org.zerock.interceptor;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.mapreduce.MapReduceResults;
import org.springframework.stereotype.Repository;

@Repository
public class LogDAO {

	@Inject
	private MongoTemplate mongoTemplate;
	

	// 로그 쓰기 
	public void insert(LogDTO log) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".insert()");
		mongoTemplate.insert(log, "log");
	}
	
	// 통계 카운트 데이터 불러오기 - part, cnt
	public List<LogCount> getLogCount(){
		String map = "function() {emit(this.part, 1)}";
		String reduce = "function(key,values){" + 
				"	  return Array.sum(values);" + 
				"	}";
		// results : iterator로 향상된 for문을 사용가능
		MapReduceResults<LogCount> results = 
		mongoTemplate.mapReduce("log", map, reduce, LogCount.class);
		
		// return 할 list를 선언
		List<LogCount> list = null;
		
		if(results != null) {
			list = new ArrayList<>();
			for(LogCount logcnt : results) list.add(logcnt);
		}
		return list;
	}
	
}
