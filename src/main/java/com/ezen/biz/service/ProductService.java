package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.ProductVO;

public interface ProductService {

	// 제품 등록
	void insertProduct(ProductVO vo);

	// 제품 수정
	void updateProduct(ProductVO vo);

	// 제품 삭제
	void deleteProduct(ProductVO vo);
	
	// 
	List<ProductVO> selectProductList();
	
	// 
	ProductVO SelectProduct(ProductVO vo);

}