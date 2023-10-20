package com.ezen.biz.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.UsersVO;

@Repository
public class UsersDAO {
   
   
   @Autowired
   private SqlSessionTemplate mybatis;
   
   
   public UsersVO selectMember(String u_id) {    
      return mybatis.selectOne("MemberDAO.selectMember", u_id);      
   }
  
   public void insertMember(UsersVO vo) {
	   mybatis.insert("MemberDAO.insertMember", vo);	
}
   
   public int idChk(UsersVO vo) {
	   return mybatis.selectOne("MemberDAO.idChk", vo);
   }
   
}