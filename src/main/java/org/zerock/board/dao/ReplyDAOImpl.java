package org.zerock.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.board.dto.Criteria;
import org.zerock.board.dto.ReplyDTO;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace 
	= "org.zerock.mapper.BoardReplyMapper.";
	
	@Override
//	public List<ReplyDTO> list(Integer no) throws Exception {
	public List<ReplyDTO> list(Integer no, Criteria cri)
			throws Exception {
		// TODO Auto-generated method stub
		// 2개의 데이터를 하나로 묶기 위해 보통 Map을 사용한다.
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("cri",cri);
		
		return session.selectList(namespace+"list", map);
	}

	@Override
	public Integer getTotalRow(Integer no) {
		return session.selectOne(namespace+"totalRow", no);
	}
	
	@Override
	public void write(ReplyDTO dto) throws Exception {
		// TODO Auto-generated method stub
		System.out.println(getClass().getSimpleName()+".write()");
		session.insert(namespace+"write", dto);
	}

	@Override
	public void update(ReplyDTO dto) throws Exception {
		// TODO Auto-generated method stub
		session.update(namespace+"update", dto);

	}

	@Override
	public void delete(Integer rno) throws Exception {
		// TODO Auto-generated method stub
		session.delete(namespace+"delete", rno);

	}

}
