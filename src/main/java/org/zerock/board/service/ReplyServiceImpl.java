package org.zerock.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.board.dao.ReplyDAO;
import org.zerock.board.dto.Criteria;
import org.zerock.board.dto.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;
	
	@Override
	public List<ReplyDTO> list(Integer no, Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(no, cri);
	}
	
	@Override
	public Integer getTotalRow(Integer no) throws Exception {
		// TODO Auto-generated method stub
		return dao.getTotalRow(no);
	}

	@Override
	public void write(ReplyDTO dto) throws Exception {
		// TODO Auto-generated method stub
		dao.write(dto);
	}

	@Override
	public void update(ReplyDTO dto) throws Exception {
		// TODO Auto-generated method stub
		dao.update(dto);
	}

	@Override
	public void delete(Integer rno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(rno);
	}

}
