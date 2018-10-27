package org.zerock.qna.dao;

import java.util.List;
import org.zerock.board.dto.Criteria;
import org.zerock.qna.dto.QnaDTO;

public interface QnaDAO {

	// 질문답변 리스트
	public List<QnaDTO> list(Criteria cri);

	// 질문답변 글보기, 글 수정 폼 - 글번호가 필요하다. 파라메터로 전달 받는다.
	public QnaDTO view(Integer no);
	
	// 질문 글쓰기 
	public void insert(QnaDTO dto) ;
	
	// 답변 글쓰기 
	public void answer(QnaDTO dto) ;
	
	// 질문답변 글수정 처리
	public void update(QnaDTO dto) ;
	
	// 질문답변 글보기 1 증가 처리
	public void increase(Integer no);
	
	// 답변 ordNo 1 증가 처리
	public void increaseOrdNo(QnaDTO dto);
	
	// 질문답변 글삭제 - 글번호를 받아서 처리
	public void delete(Integer no) ;

	// 게시판 전체 글의 갯수 구하는 메서드
	public Integer getTotalCount(Criteria cri);
	
}
