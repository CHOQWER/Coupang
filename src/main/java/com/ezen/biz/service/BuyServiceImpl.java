package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.BuyDAO;
import com.ezen.biz.dto.BuyVO;
@Service
public class BuyServiceImpl implements BuyService {
	@Autowired
	private BuyDAO dao;


	//환불하기- 판매자
	//상품구매후 취소
	@Override
	public void refundProduct(BuyVO vo) {
		dao.refundProduct(vo);
	}

	//관리자가 구매내역 확인
	@Override
	public List<BuyVO> adminSelectBuyList(BuyVO vo) {
		return dao.adminSelectBuyList(vo);
	}

	//판매자가 구매내역 확인
	@Override
	public List<BuyVO> sellerSelectBuyList(BuyVO vo) {
		return dao.sellerSelectBuyList(vo);
	}
	//구매사이트로 이동 
	public int insertBuy(BuyVO vo) {	
			
		return dao.insertBuy(vo);
	}

	@Override
	public List<BuyVO> selectBuyList(BuyVO vo) {
		
		return dao.selectBuyList(vo);
	}

	
}
