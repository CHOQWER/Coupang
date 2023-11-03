package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.BuyVO;
import com.ezen.biz.dto.SalesVO;

@Repository
public class SellerDAO {
	@Autowired
	private SqlSessionTemplate mybatis;

	
	// 카테고리별 매출 확인
	public List<SalesVO> salesCate(String u_id) {
		return mybatis.selectList("sellerDAO.salesCate",u_id);
	}

}
