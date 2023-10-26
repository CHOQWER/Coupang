package com.ezen.biz.service;

import com.ezen.biz.dto.UsersVO;

public interface UsersService {

	UsersVO selectMember(String u_id);
	
	void insertMember(UsersVO vo);
	
	int idCheck(String id);
	
	UsersVO pwdCheck(String id);
	
	void updateUser(UsersVO vo);
	
	void deleteUser(String u_id);
	
	void updateMember(UsersVO vo);
}