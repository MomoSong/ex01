package org.zerock.data.dao;

import java.util.List;

import org.zerock.board.dto.Criteria;
import org.zerock.data.dto.AttachFile;
import org.zerock.data.dto.DataDTO;

public interface DataDAO {

	// 자료실 리스트
	public List<DataDTO> list(Criteria cri);

	// 자료실 글보기, 글 수정 폼 - 글번호가 필요하다. 파라메터로 전달 받는다.
	public DataDTO view(Integer no);
	
	// 자료실 글쓰기 
	public void insert(DataDTO dataDTO);
	
	// 자료실 글수정 처리
	public void update(DataDTO dataDTO);
	
	// 자료실 글보기 1 증가 처리
	public void increase(Integer no);

	// 자료실 글삭제 - 글번호를 받아서 처리
	public void delete(Integer no);

	// 게시판 전체 글의 갯수 구하는 메서드
	public Integer getTotalCount(Criteria cri);

	public void insertFile(DataDTO dataDTO);

	public List<AttachFile> getFiles(int no);
	
}
