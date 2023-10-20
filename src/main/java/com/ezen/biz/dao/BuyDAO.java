package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.BuyVO;

@Repository
public class BuyDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	/*
	 * public void sellerInsertProduct(BuyVO vo) {
	 * mybatis.insert("BuyDAO.sellerInsertProduct", vo); }
	 */
	
	public void refundProduct(BuyVO vo) {
		mybatis.delete("BuyDAO.refundProduct", vo);
	}
	
	public List<BuyVO> adminSelectBuyList(BuyVO vo) {
		return mybatis.selectList("BuyDAO.adminSelectBuyList",vo);
	}
	
	public List<BuyVO> sellerSelectBuyList(BuyVO vo) {
		return mybatis.selectList("BuyDAO.sellerSelectBuyList",vo);
	}
	
}
