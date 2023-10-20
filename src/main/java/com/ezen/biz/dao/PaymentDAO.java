package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.PaymentVO;

@Repository
public class PaymentDAO {
   
   
   @Autowired
   private SqlSessionTemplate mybatis;
	  
   
   public void insertCard(PaymentVO vo) {
	   mybatis.insert("PaymentDAO.insertCard", vo);	
}

public int cardcheck(PaymentVO vo) {
	   return mybatis.selectOne("PaymentDAO.cardcheck", vo);
}


public List<PaymentVO> selectCardList(PaymentVO vo) {
	return mybatis.selectList("PaymentDAO.selectCardList",vo); 
}
}