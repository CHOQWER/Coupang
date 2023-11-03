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
	  
	 public int insertCart(CartVO vo) {
		   return mybatis.insert("CartDAO.insertCart", vo);	
}
	 public List<CartVO> selectCartList(CartVO vo) {
			return mybatis.selectList("CartDAO.selectCartList",vo); 
}
	public int selectMaxCno(CartVO vo) {
		return mybatis.selectOne("CartDAO.selectMaxCno",vo); 
		
	}
	public int deleteCart(CartVO vo) {
		return mybatis.delete("CartDAO.deleteCart",vo);
	}
	 public CartVO checkselectCart(CartVO vo) {
			return mybatis.selectOne("CartDAO.checkselectCart",vo); 
	 }
	public int updateCnt(CartVO vo) {
			return mybatis.update("CartDAO.updateCnt",vo);
		}
}
