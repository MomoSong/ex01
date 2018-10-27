package org.zerock.board.dao;

import java.util.List;

import org.zerock.board.dto.Criteria;
import org.zerock.board.dto.ReplyDTO;

public interface ReplyDAO {

	public List<ReplyDTO> list(Integer no, Criteria cri) throws Exception;
	public void write(ReplyDTO dto) throws Exception;
	public void update(ReplyDTO dto) throws Exception;
	public void delete(Integer rno) throws Exception;
	public Integer getTotalRow(Integer no) throws Exception;
}
