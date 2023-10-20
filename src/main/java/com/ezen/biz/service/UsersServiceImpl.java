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
	
	@Override
	public int idChk(UsersVO vo) {
		return dao.idChk(vo);
	}
	


}