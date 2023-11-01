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
      return mybatis.selectOne("UsersDAO.selectMember", u_id);      
   }
  
   public void insertMember(UsersVO vo) {
	   mybatis.insert("UsersDAO.insertMember", vo);	
}
   
   public int idCheck(String id) {
	   return mybatis.selectOne("UsersDAO.idCheck", id);
   }
   
   public UsersVO pwdCheck(String id) {
	   return mybatis.selectOne("UsersDAO.pwdCheck", id);
   }
   
   public void updateUser(UsersVO vo) {
	   mybatis.update("UsersDAO.updateUser", vo);
   }
   
   public void deleteUser(String u_id) {
	   mybatis.update("UsersDAO.deleteUser", u_id);
   }
   
   public void wowupdate(UsersVO vo) {
	   mybatis.update("UsersDAO.wowupdate", vo);
   }
   
   public void wowsecess(UsersVO vo) {
	   mybatis.update("UsersDAO.wowsecess", vo);
   }
   
}