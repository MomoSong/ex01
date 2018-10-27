package org.zerock.data.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.board.dto.Criteria;
import org.zerock.data.dao.DataDAO;
import org.zerock.data.dto.DataDTO;

public interface DataService {

	// 자료실 리스트
	public List<DataDTO> list(Criteria cri);
	
	// 자료실 글보기+1증가, 글수정 - 글번호를 받아서 dao 한테 전달
	public DataDTO view(Integer no, boolean isView);
	
	// 자료실 글쓰기 - DataDTO를 받아서 dao 한테 전달
	public void insert(DataDTO dataDTO);
	
	// 자료실 글수정 - BoardDTO를 받아서 dao 한테 전달
	public void update(DataDTO dataDTO);
	
	// 자료실 글삭제 - 글번호(no)를 받아서 dao 한테 전달
	public void delete(Integer no);

	public Object getFiles(int no);
	
}
