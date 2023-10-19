package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.ezen.biz.dao.BuyDAO;
import com.ezen.biz.dto.BuyVO;

public class BuyServiceImpl implements BuyService {
	@Autowired
	private BuyDAO dao;

	//구매하기-구매자
	//현재수량 -재고 하기(17참고)
	@Override
	public void buyProduct(BuyVO vo) {
		dao.buyProduct(vo);
	}

	//환불하기- 판매자
	//상품구매후 취소
	@Override
	public void refundProduct(BuyVO vo) {
		dao.refundProduct(vo);
	}

	//관리자가 구매내역 확인
	@Override
	public List<BuyVO> adminSelectBuyList() {
		return dao.adminSelectBuyList();
	}

	//판매자가 구매내역 확인
	@Override
	public List<BuyVO> sellerSelectBuyList() {
		return dao.sellerSelectBuyList();
	}

}
