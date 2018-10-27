package org.zerock.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.board.dao.BoardDAO;
import org.zerock.board.dao.ReplyDAO;
import org.zerock.board.dto.BoardDTO;
import org.zerock.board.dto.Criteria;
import org.zerock.board.dto.ReplyDTO;

@Service
public class BoardService {

	@Inject
	private BoardDAO dao;
	
	@Inject
	private ReplyDAO replyDAO;
	
	// 게시판 리스트
	public List<BoardDTO> list(Criteria cri) {
		System.out.println(getClass().getSimpleName()+".list()");
		// 페이지에 대한 계산을 한다.
		cri.setTotalCount(dao.getTotalCount(cri));
		cri.calcData();
		System.out.println(cri);
		return dao.list(cri);
	}
	
	// 게시판 글보기+1증가, 글수정 - 글번호를 받아서 dao 한테 전달
	public BoardDTO view(Integer no, boolean isView) {
		System.out.println(getClass().getSimpleName()+".view()");
		// 글보기 할 때 increase 시킨다. 조회수 1증가.
		if(isView) dao.increase(no);
		return dao.view(no);
	}
	
	// 게시판 글쓰기 - BoardDTO를 받아서 dao 한테 전달
	public void insert(BoardDTO boardDTO) {
		System.out.println(getClass().getSimpleName()+".insert()");
		dao.insert(boardDTO);
	}
	
	// 게시판 글수정 - BoardDTO를 받아서 dao 한테 전달
	public void update(BoardDTO boardDTO) {
		System.out.println(getClass().getSimpleName()+".update()");
		dao.update(boardDTO);
	}
	
	// 게시판 글삭제 - 글번호(no)를 받아서 dao 한테 전달
	public void delete(Integer no) {
		System.out.println(getClass().getSimpleName()+".delete()");
		dao.delete(no);
	}
	
	// 트렌젝션 테스트를 위한 메서드 - 게시판 글쓰기 , 댓글 쓰기 동시에 처리
	@Transactional
	public void testTransaction() throws Exception {
		// 게시판 글쓰기
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setTitle("tran");
		boardDTO.setContent("tran");
		boardDTO.setWriter("tran");
		dao.insert(boardDTO); // 정상처리
		System.out.println("게시판 글쓰기 성공");
		// 댓글쓰기
		ReplyDTO replyDTO = new ReplyDTO();
		replyDTO.setNo(1000); // 무결성 제약조건 오류
		replyDTO.setContent("tran");
		replyDTO.setWriter("tran");
		replyDAO.write(replyDTO);
	}
}
