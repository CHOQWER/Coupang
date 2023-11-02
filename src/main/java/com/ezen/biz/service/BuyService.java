package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.BuyVO;
import com.ezen.biz.dto.DeliveryVO;

public interface BuyService {
	void sellerStaY(BuyVO vo);
	
	void sellerStaN(BuyVO vo);

	void refundProduct(BuyVO vo);

	List<BuyVO> adminSelectBuyList(BuyVO vo);

	List<BuyVO> sellerSelectBuyList(BuyVO vo);
	
	//배송지 추가,목록,삭제
	List<DeliveryVO> selectDeli(String u_id);
	
	int insertDeli(DeliveryVO vo);
	
	int deleteDeli(int dno);

	List<BuyVO> sellerBeforeDelivery(BuyVO vo);

	int insertBuy(BuyVO vo);

	List<BuyVO> selectBuyList(BuyVO vo);
	
}