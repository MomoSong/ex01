package org.zerock.member.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.member.dto.LoginDTO;

@Repository
public class MemberDaoImpl {

	@Inject
	private SqlSession sqlSession;
	
	private String namespace = "org.zerock.mapper.MemberMapper.";
	
	public LoginDTO login(String id, String pw) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		return sqlSession.selectOne(namespace+"login", map);
	}
}
