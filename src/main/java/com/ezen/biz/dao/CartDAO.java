package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.CartVO;

@Repository
public class CartDAO {
	
	
	@Autowired
	private SqlSessionTemplate mybatis;
	  
	 public void insertCart(CartVO vo) {
		   mybatis.insert("CartDAO.insertCart", vo);	
}
	 public List<CartVO> selectCartList(CartVO vo) {
			return mybatis.selectList("CartDAO.selectCartList",vo); 
}   
}
