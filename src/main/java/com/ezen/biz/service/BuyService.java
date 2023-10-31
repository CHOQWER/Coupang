package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.BuyVO;

public interface BuyService {
	void sellerStaY(BuyVO vo);
	
	void sellerStaN(BuyVO vo);
	
	void insertBuy(BuyVO vo);

	void refundProduct(BuyVO vo);

	List<BuyVO> adminSelectBuyList(BuyVO vo);

	List<BuyVO> sellerSelectBuyList(BuyVO vo);

	List<BuyVO> sellerBeforeDelivery(BuyVO vo);

}