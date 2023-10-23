package com.ezen.biz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.UsersDAO;
import com.ezen.biz.dto.UsersVO;


@Service
public class UsersServiceImpl implements UsersService {
	
	@Autowired
	private UsersDAO dao;
	
	public void insertMember(UsersVO vo) {
		dao.insertMember(vo);
	}
	public UsersVO selectMember(String u_id) {
		return dao.selectMember(u_id);
	}
	
	
	public int idCheck(String id) {
		int result=0;
		result=dao.idCheck(id);
		return result;
		
	}
	
	public UsersVO pwdCheck(String id) {		
		return dao.pwdCheck(id);
	}
	
	
	


}