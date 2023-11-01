package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.BuyVO;
import com.ezen.biz.dto.UsersVO;

public interface UsersService {
	
	List<BuyVO> delivseryStatus(UsersVO vo);

	UsersVO selectMember(String u_id);
	
	void insertMember(UsersVO vo);
	
	int idCheck(String id);
	
	UsersVO pwdCheck(String id);
	
	void updateUser(UsersVO vo);
	
	void deleteUser(String u_id);
	
	void updateMember(UsersVO vo);
	
	void wowupdate(UsersVO vo);
	
	void wowsecess(UsersVO vo);
}