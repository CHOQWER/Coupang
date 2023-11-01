package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.BuyDAO;
import com.ezen.biz.dao.DeliveryDAO;
import com.ezen.biz.dto.BuyVO;
import com.ezen.biz.dto.DeliveryVO;
@Service
public class BuyServiceImpl implements BuyService {
	@Autowired
	private BuyDAO dao;
	
	@Autowired
	private DeliveryDAO ddao;


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

	@Override
	public List<DeliveryVO> selectDeli(String u_id) {
		return ddao.selectDeli(u_id);
	}

	@Override
	public int insertDeli(DeliveryVO vo) {
		return ddao.insertDeli(vo);
	}

	@Override
	public int deleteDeli(int dno) {
		return ddao.deleteDeli(dno);
	}

}
