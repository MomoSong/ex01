package org.zerock.member.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.member.dao.MemberDaoImpl;
import org.zerock.member.dto.LoginDTO;

@Service
public class MemberServiceImpl {

	@Inject
	private MemberDaoImpl dao;
	
	public LoginDTO login(String id, String pw){
		return dao.login(id, pw);
	}
}
