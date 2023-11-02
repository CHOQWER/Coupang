package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.BuyVO;
import com.ezen.biz.dto.ImagesVO;

@Repository
public class ImagesDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	 public void insertImages(ImagesVO vo) {
		   mybatis.insert("ImagesDAO.insertImages", vo);
}

	public void sellerDeleteImages(int pno) {
		mybatis.delete("ImagesDAO.sellerDeleteImages", pno);
		
	}
	public List<ImagesVO> getThumbnailImage(int pno) {
		return mybatis.selectList("ImagesDAO.getThumbnailImage", pno);
		
	}

	public List<ImagesVO> pullIno(int pno) {
		return  mybatis.selectList("ImagesDAO.pullIno", pno);
	}
	 
}
