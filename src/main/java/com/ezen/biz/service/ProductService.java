package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.MainCateVO;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.dto.SubCateVO;
import com.ezen.biz.utils.Criteria;

public interface ProductService {

	// 제품 등록
	void sellerInsertProduct(ProductVO vo);

	// 제품 수정
	void sellerUpdateProduct(ProductVO vo);

	// 제품 삭제
	void sellerDeleteProduct(ProductVO vo);
	
	// 전체 상품조회
	List<ProductVO> selectProductList();
	
	// 판매자 상품등록 내역조회
	List<ProductVO> sellerSellectMineProduct(ProductVO vo);
	
	// 
	ProductVO SelectProduct(ProductVO vo);
	
	//카테고리별 제품 리스트 
	List<ProductVO> selectProductList(int sca_no, Criteria cri);
	
	List<MainCateVO> getCategory();
	
	List<SubCateVO> getSubCategory(int ca_no);
	
	int selectRowCount(int sca_no);
	
	List<ProductVO> selectProductListPno(int pno);

}