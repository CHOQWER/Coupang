package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.BuyVO;

public interface BuyService {

	void refundProduct(BuyVO vo);

	List<BuyVO> adminSelectBuyList(BuyVO vo);

	List<BuyVO> sellerSelectBuyList(BuyVO vo);

	int insertBuy(BuyVO vo);

	List<BuyVO> selectBuyList(BuyVO vo);
	
}