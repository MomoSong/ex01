package org.zerock.qna.service;

import java.util.List;

import org.zerock.board.dto.Criteria;
import org.zerock.qna.dto.QnaDTO;

public interface QnaService {

	// 질문답변 리스트
	public List<QnaDTO> list(Criteria cri);
	
	// 질문답변 글보기+1증가, 글수정 - 글번호를 받아서 dao 한테 전달
	public QnaDTO view(Integer no, boolean isView) ;
	
	// 질문 글쓰기 - QnaDTO를 받아서 dao 한테 전달
	public void insert(QnaDTO dto);
	
	// 답변 글쓰기 - QnaDTO를 받아서 dao 한테 전달
	public void answer(QnaDTO dto);
	
	// 질문답변 글수정 - QnaDTO를 받아서 dao 한테 전달
	public void update(QnaDTO dto);
	
	// 질문답변 글삭제 - 글번호(no)를 받아서 dao 한테 전달
	public void delete(Integer no);

	
}
