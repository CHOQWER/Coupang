package com.ezen.biz.service;

import com.ezen.biz.dto.UsersVO;

public interface UsersService {

	UsersVO selectMember(String u_id);
	
	void insertMember(UsersVO vo);
	
	int idChk(UsersVO vo);
}