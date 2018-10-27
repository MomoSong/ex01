package org.zerock.mongo.dao;

import java.util.List;

import javax.inject.Inject;

import org.springframework.dao.DataAccessException;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.data.mongodb.core.DbCallback;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;
import org.zerock.mongo.dto.MongoBoardDTO;

import com.mongodb.DB;
import com.mongodb.MongoException;

@Repository
public class MongoBoardDAO {

	@Inject
	private MongoTemplate mongoTemplate;
	
	// 게시판 리스트
	public List<MongoBoardDTO> list(org.zerock.board.dto.Criteria cri) {
		System.out.println(getClass().getSimpleName()+".list()");
		Query query = new Query().with(new Sort(Direction.DESC, "no"));
		query.skip((cri.getPage()-1)*cri.getPerPageNum());
		query.limit(cri.getPerPageNum());
		return mongoTemplate.find(query, MongoBoardDTO.class,
				"board");
	}

	// 게시판 글보기, 글 수정 폼 - 글번호가 필요하다. 파라메터로 전달 받는다.
	public MongoBoardDTO view(Integer no) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".view()");
		Query query = new Query(Criteria.where("_id").is(no));
		return mongoTemplate.findOne(query, MongoBoardDTO.class, "board");
	}
	
	// 게시판 글쓰기 
	public void insert(MongoBoardDTO dto) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".insert()");
		mongoTemplate.insert(dto, "board");
	}
	
	// 게시판 글쓰기를 하려면 글번호를 알아내야한 그래서 seq_no('board_seq')
	public Integer getNo() {
		return mongoTemplate.execute(new DbCallback<Integer>() {

			@Override
			public Integer doInDB(DB db) throws MongoException, DataAccessException {
				// TODO Auto-generated method stub
				return ((Double)db.eval("seq_no('board_seq')")).intValue();
			}
		});
	}
	
	// 게시판 글수정 처리
	public void update(MongoBoardDTO dto) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".update()");
		Query query = new Query(Criteria.where("_id").is(dto.getNo()));
		Update update = new Update();
		update.set("title", dto.getTitle());
		update.set("content", dto.getContent());
		update.set("writer", dto.getWriter());
		mongoTemplate.updateFirst(query, update, "board");
	}
	
	// 게시판 글보기 1 증가 처리
	public void increase(Integer no) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".increase()");
		Query query = new Query(Criteria.where("_id").is(no));
		Update update = new Update().inc("hit", 1);
		mongoTemplate.updateFirst(query, update, "board");
	}
	
	// 게시판 글삭제 - 글번호를 받아서 처리
	public void delete(Integer no) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".delete()");
		Query query = new Query(Criteria.where("_id").is(no));
		mongoTemplate.remove(query, "board");
	}

	// 게시판 전체 글의 갯수 구하는 메서드
	public Integer getTotalCount(org.zerock.board.dto.Criteria cri) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".getTotalCount()");
		// mongoTemplate.count()-> 결과가 long type으로 나온다. 그래서 캐스팅을 반드시 한다.
		return (int)mongoTemplate.count(new Query(), "board");
	}
	
}
