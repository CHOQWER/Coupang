package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.ImagesVO;
import com.ezen.biz.dto.MainCateVO;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.dto.SubCateVO;
import com.ezen.biz.utils.Criteria;

public interface ProductService {
	
	int sellerGetPno();
	
	// 제품 등록
	void sellerInsertProduct(ProductVO vo);

	// 제품 수정
	void sellerUpdateProduct(ProductVO vo);

	// 제품 삭제
	void sellerDeleteProduct(int pno);
	
	// 전체 상품조회
	List<ProductVO> selectProductList();
	
	// 판매자 상품등록 내역조회
	List<ProductVO> sellerSelectMineProduct(ProductVO vo);
	
	// 
	ProductVO SelectProduct(ProductVO vo);
	
	//카테고리별 제품 리스트 
	List<ProductVO> selectProductList(int sca_no, Criteria cri);
	
	List<MainCateVO> getCategory();
	
	List<SubCateVO> getSubCategory(int ca_no);
	
	int selectRowCount(int sca_no);
	
	int selectRowCount(ProductVO vo);
	
	//pno로 제품검색
	ProductVO selectProductPno(int pno);
	//이미지까지 제품 장바구니로 넘기는거
	ProductVO selectProductcartPno(int pno);
	
	ImagesVO selectImgPno(int pno);
	
	//회사별 검색
	List<ProductVO> selectCompany(int sca_no);
	
	List<ProductVO> selectCompanylist(ProductVO vo,Criteria cri);
	
	//메인 카테고리로 검색
	List<ProductVO> selectMainCateList(int ca_no, Criteria cri);
	
	int selectRowCountCa(int ca_no);
	
	//검색어로 검색
	List<ProductVO> selectSearchlist(ProductVO vo, Criteria cri);
	
	
	int selectRowCountword(int ca_no, Criteria cri);

}