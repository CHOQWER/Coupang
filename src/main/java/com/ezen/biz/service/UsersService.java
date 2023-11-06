package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.BuyVO;
import com.ezen.biz.dto.UsersVO;

public interface UsersService {
	
	List<BuyVO> deliveryStatus(UsersVO vo);

	UsersVO selectMember(String id);
	
	void insertMember(UsersVO vo);
	
	int idCheck(String id);
	
	UsersVO pwdCheck(String id);
	
	void updateUser(UsersVO vo);
	
	void deleteUser(String id);
	
	void wowupdate(UsersVO vo);
	
	void wowsecess(UsersVO vo);
}