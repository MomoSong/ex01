package org.zerock.qna.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.board.dto.Criteria;
import org.zerock.qna.dto.QnaDTO;

@Repository
public class QnaDAOImpl implements QnaDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static String namespace = "org.zerock.mapper.QnaMapper.";
	
	// 질문답변 리스트
	public List<QnaDTO> list(Criteria cri) {
		System.out.println(getClass().getSimpleName()+".list()");
		return sqlSession.selectList
				(namespace+"list", cri);
	}

	// 질문답변 글보기, 글 수정 폼 - 글번호가 필요하다. 파라메터로 전달 받는다.
	public QnaDTO view(Integer no) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".view()");
		return sqlSession.selectOne
		(namespace+"view", no);
	}
	
	// 질문 글쓰기 
	public void insert(QnaDTO dto) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".insert()");
		sqlSession.insert
		(namespace+"insert", dto);
	}
	
	// 답변 글쓰기 
	public void answer(QnaDTO dto) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".answer()");
		sqlSession.insert
		(namespace+"answer", dto);
	}
	
	// 질문답변 글수정 처리
	public void update(QnaDTO dto) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".update()");
		sqlSession.update
		(namespace+"update", dto);
	}
	
	// 질문답변 글보기 1 증가 처리
	public void increase(Integer no) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".increase()");
		sqlSession.update
		(namespace+"increase", no);
	}
	
	// 답변 등록시 ordNo를 1 증가 처리
	public void increaseOrdNo(QnaDTO dto) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".increase()");
		sqlSession.update
		(namespace+"increaseOrdNo", dto);
	}
	
	// 질문답변 글삭제 - 글번호를 받아서 처리
	public void delete(Integer no) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".delete()");
		sqlSession.delete
		(namespace+"delete", no);
	}

	// 질문답변 전체 글의 갯수 구하는 메서드
	public Integer getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".getTotalCount()");
		return sqlSession.selectOne
		(namespace+"totalCount", cri);
	}
	
}
