package org.zerock.mongo.service;

import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.board.dao.BoardDAO;
import org.zerock.board.dao.ReplyDAO;
import org.zerock.board.dto.BoardDTO;
import org.zerock.board.dto.Criteria;
import org.zerock.board.dto.ReplyDTO;
import org.zerock.mongo.dao.MongoBoardDAO;
import org.zerock.mongo.dto.MongoBoardDTO;

@Service
public class MongoBoardService {

	@Inject
	private MongoBoardDAO dao;
	
	// 게시판 리스트
	public List<MongoBoardDTO> list(Criteria cri) {
		System.out.println(getClass().getSimpleName()+".list()");
		// 페이지에 대한 계산을 한다.
		cri.setTotalCount(dao.getTotalCount(cri));
		cri.calcData();
		System.out.println(cri);
		return dao.list(cri);
	}
	
	// 게시판 글보기+1증가, 글수정 - 글번호를 받아서 dao 한테 전달
	public MongoBoardDTO view(Integer no, boolean isView) {
		System.out.println(getClass().getSimpleName()+".view()");
		// 글보기 할 때 increase 시킨다. 조회수 1증가.
		if(isView) dao.increase(no);
		return dao.view(no);
	}
	
	// 게시판 글쓰기 - BoardDTO를 받아서 dao 한테 전달
	public void insert(MongoBoardDTO dto) {
		System.out.println(getClass().getSimpleName()+".insert()");
		// 1.빠진 데이터를 넣어야 한다. - 글번호, 작성일, 조회수를 채운다.
		dto.setNo(dao.getNo());
		dto.setWriteDate(new Date());
		dto.setHit(0);
		dao.insert(dto);
	}
	
	// 게시판 글수정 - BoardDTO를 받아서 dao 한테 전달
	public void update(MongoBoardDTO dto) {
		System.out.println(getClass().getSimpleName()+".update()");
		dao.update(dto);
	}
	
	// 게시판 글삭제 - 글번호(no)를 받아서 dao 한테 전달
	public void delete(Integer no) {
		System.out.println(getClass().getSimpleName()+".delete()");
		dao.delete(no);
	}
	
}
