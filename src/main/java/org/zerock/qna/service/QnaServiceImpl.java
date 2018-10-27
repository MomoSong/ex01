package org.zerock.qna.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.board.dto.Criteria;
import org.zerock.qna.dao.QnaDAO;
import org.zerock.qna.dto.QnaDTO;

@Service
public class QnaServiceImpl implements QnaService{

	@Inject
	private QnaDAO dao;
	
	// 질문답변 리스트
	public List<QnaDTO> list(Criteria cri) {
		System.out.println(getClass().getSimpleName()+".list()");
		// 페이지에 대한 계산을 한다.
		cri.setTotalCount(dao.getTotalCount(cri));
		cri.calcData();
		System.out.println(cri);
		return dao.list(cri);
	}
	
	// 질문답변 글보기+1증가, 글수정 - 글번호를 받아서 dao 한테 전달
	public QnaDTO view(Integer no, boolean isView) {
		System.out.println(getClass().getSimpleName()+".view()");
		// 글보기 할 때 increase 시킨다. 조회수 1증가.
		if(isView) dao.increase(no);
		return dao.view(no);
	}
	
	// 질문 글쓰기 - QnaDTO를 받아서 dao 한테 전달
	public void insert(QnaDTO dto) {
		System.out.println(getClass().getSimpleName()+".insert()");
		dao.insert(dto);
	}
	// 답변 글쓰기 - QnaDTO를 받아서 dao 한테 전달
	public void answer(QnaDTO dto) {
		System.out.println(getClass().getSimpleName()+".answer()");
		// refNo가 같은 데이터 중에 ordNo 보다 같거나 큰 번호는 +1 증가시킨다.
		dao.increaseOrdNo(dto);
		dao.answer(dto);
	}
	
	// 질문답변 글수정 - QnaDTO를 받아서 dao 한테 전달
	public void update(QnaDTO dto) {
		System.out.println(getClass().getSimpleName()+".update()");
		dao.update(dto);
	}
	
	// 질문답변 글삭제 - 글번호(no)를 받아서 dao 한테 전달
	public void delete(Integer no) {
		System.out.println(getClass().getSimpleName()+".delete()");
		dao.delete(no);
	}
	
}
