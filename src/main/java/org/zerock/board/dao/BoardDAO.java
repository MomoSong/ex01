package org.zerock.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.board.dto.BoardDTO;
import org.zerock.board.dto.Criteria;

@Repository
public class BoardDAO {

	@Inject
	private SqlSession sqlSession;
	
	// 게시판 리스트
	public List<BoardDTO> list(Criteria cri) {
		System.out.println(getClass().getSimpleName()+".list()");
		return sqlSession.selectList
				("org.zerock.mapper.BoardMapper.list", cri);
	}

	// 게시판 글보기, 글 수정 폼 - 글번호가 필요하다. 파라메터로 전달 받는다.
	public BoardDTO view(Integer no) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".view()");
		return sqlSession.selectOne
		("org.zerock.mapper.BoardMapper.view", no);
	}
	
	// 게시판 글쓰기 
	public void insert(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".insert()");
		sqlSession.insert
		("org.zerock.mapper.BoardMapper.insert", boardDTO);
	}
	
	// 게시판 글수정 처리
	public void update(BoardDTO boardDTO) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".update()");
		sqlSession.update
		("org.zerock.mapper.BoardMapper.update", boardDTO);
	}
	
	// 게시판 글보기 1 증가 처리
	public void increase(Integer no) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".increase()");
		sqlSession.update
		("org.zerock.mapper.BoardMapper.increase", no);
	}
	
	// 게시판 글삭제 - 글번호를 받아서 처리
	public void delete(Integer no) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".delete()");
		sqlSession.delete
		("org.zerock.mapper.BoardMapper.delete", no);
	}

	// 게시판 전체 글의 갯수 구하는 메서드
	public Integer getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".getTotalCount()");
		return sqlSession.selectOne
		("org.zerock.mapper.BoardMapper.totalCount", cri);
	}
	
}
