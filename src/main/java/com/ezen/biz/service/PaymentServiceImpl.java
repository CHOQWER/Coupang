package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.PaymentDAO;
import com.ezen.biz.dto.DeliveryVO;
import com.ezen.biz.dto.PaymentVO;
@Service
public class PaymentServiceImpl implements PaymentService {
@Autowired
private PaymentDAO dao;

public void insertCard(PaymentVO vo) {
	dao.insertCard(vo);
}
@Override
public int cardChk(PaymentVO vo) {
	return dao.cardcheck(vo);
}
@Override
public List<PaymentVO> selectCardList(PaymentVO vo) {
	return dao.selectCardList(vo);
}
public int deleteCard(PaymentVO vo) {	
	return dao.deleteCard(vo);
}
@Override
public List<PaymentVO> cardselect(String u_id) {
	return dao.selectcard(u_id);
}
}
