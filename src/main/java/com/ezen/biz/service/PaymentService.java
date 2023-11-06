package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.DeliveryVO;
import com.ezen.biz.dto.PaymentVO;

public interface PaymentService {

	List<PaymentVO> selectCardList(PaymentVO vo);
	
	void insertCard(PaymentVO vo);
	
	int cardChk(PaymentVO vo);
	
	int deleteCard(PaymentVO vo);
	//카드선택
	List<PaymentVO> cardselect(String u_id);
	
	
}