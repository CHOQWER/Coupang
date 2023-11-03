package com.ezen.biz.dao;


import java.util.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.BuyVO;
import com.ezen.biz.dto.ProductVO;

@Repository
public class BuyDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	/*
	 * public void sellerInsertProduct(BuyVO vo) {
	 * mybatis.insert("BuyDAO.sellerInsertProduct", vo); }
	 */
	//구매하기 후->판매자 판매 확인 o/x  
	public List<BuyVO> sellerBeforeDelivery(BuyVO vo) {
		return mybatis.selectList("sellerDAO.sellerBeforeDelivery", vo);
	}
	
	public void sellerStaY(BuyVO vo) {
		 mybatis.update("sellerDAO.sellerStaY", vo);
	}
	public void sellerStaN(BuyVO vo) {
		 mybatis.update("sellerDAO.sellerStaN", vo);
	}
	
	// 판매자 -> 환불받기
	public void sellerInsertProduct(BuyVO vo) {
		mybatis.insert("BuyDAO.sellerInsertProduct", vo);
	}

	public void refundProduct(BuyVO vo) {
		mybatis.delete("BuyDAO.refundProduct", vo);
	}

	// 관리자가 구매내역 확인
	public List<BuyVO> adminSelectBuyList(BuyVO vo) {
		return mybatis.selectList("BuyDAO.adminSelectBuyList", vo);
	}

	// 판매자가 구매내역 확인
	public List<BuyVO> sellerSelectBuyList(BuyVO vo) {
		return mybatis.selectList("BuyDAO.sellerSelectBuyList", vo);
	}
	//장바구니에서 구매홈페이지로 이동
	public int insertBuy(BuyVO vo) {
	   return mybatis.insert("BuyDAO.insertBuy", vo);
	}
	public List<BuyVO> selectBuyList(BuyVO vo) {
		return mybatis.selectList("BuyDAO.selectBuyList",vo);
	}
	public void refundBuyProduct(int bno) {
		mybatis.delete("BuyDAO.refundBuyProduct",bno);
	}
	public ProductVO selectBuyOne(int pno) {
		return mybatis.selectOne("BuyDAO.selectBuyOne",pno);
	}
	
}
