package com.ezen.biz.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.BuyVO;
import com.ezen.biz.dto.ImagesVO;
import com.ezen.biz.dto.ProductVO;

@Repository
public class ImagesDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	 public void insertImages(ProductVO vo) {
		   mybatis.insert("ImagesDAO.insertImages", vo);
}
	 
}
