package com.ezen.biz.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.ImagesVO;

@Repository
public class ImagesDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	 public void insertImages(ImagesVO vo) {
		   mybatis.insert("sellerDAO.insertImages", vo);
}

	public void sellerDeleteImages(int pno) {
		mybatis.delete("sellerDAO.sellerDeleteImages", pno);
		
	}
	 
}
