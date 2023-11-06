package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.UsersDAO;
import com.ezen.biz.dto.BuyVO;
import com.ezen.biz.dto.UsersVO;


@Service
public class UsersServiceImpl implements UsersService {
	
	@Autowired
	private UsersDAO dao;
	
	public List<BuyVO>  deliveryStatus(UsersVO vo) {
		return dao.deliveryStatus(vo);
	}
	
	public void insertMember(UsersVO vo) {
		dao.insertMember(vo);
	}
	public UsersVO selectMember(String id) {
		return dao.selectMember(id);
	}
	
	
	public int idCheck(String id) {
		int result=0;
		result=dao.idCheck(id);
		return result;
		
	}
	
	public UsersVO pwdCheck(String id) {		
		return dao.pwdCheck(id);
	}
	
	
	public void updateUser(UsersVO vo) {
		dao.updateUser(vo);
		
	}
	
	public void deleteUser(String id) {
		dao.deleteUser(id);
		
	}	
	
	
	public void wowupdate(UsersVO vo) {
		dao.wowupdate(vo);	
		
	}
	
	
	public void wowsecess(UsersVO vo) {
		dao.wowsecess(vo);
		
	}




	
	
	


}