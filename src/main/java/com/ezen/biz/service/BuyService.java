package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.BuyVO;

public interface BuyService {

	void buyProduct(BuyVO vo);

	void refundProduct(BuyVO vo);

	List<BuyVO> adminSelectBuyList();

	List<BuyVO> sellerSelectBuyList();

}