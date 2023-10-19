package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.ProductVO;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 제품 등록
	public void insertProduct(ProductVO vo) {
		mybatis.insert("ProductDAO.insertProduct", vo);
	}
	
	// 제품 수정
	public void updateProduct(ProductVO vo) {
		mybatis.update("ProductDAO.updateProduct", vo);
	}
	
	// 제품 삭제
	public void deleteProduct(ProductVO vo) {
		mybatis.delete("ProductDAO.deleteProduct", vo);
	}
	
	public List<ProductVO> selectProductList(){
		return mybatis.selectList("ProductDAO.selectProductList");
	}
	
	public ProductVO SelectProduct(ProductVO vo) {
		return mybatis.selectOne("ProductDAO.selectProduct", vo);
	}
	
}
