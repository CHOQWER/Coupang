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
	

	
	List<MainCateVO> getCategory();
	
	List<SubCateVO> getSubCategory(int ca_no);
	

	//pno로 제품검색
	ProductVO selectProductPno(int pno);
	//이미지까지 제품 장바구니로 넘기는거
	ProductVO selectProductcartPno(int pno);
	
	//결제 페이지로 넘기는거
	ProductVO selectProductbuyPno(int pno);
	
	ImagesVO selectImgPno(int pno);
	
	// sca_no로 company list 조회
	List<ProductVO> companyListSca(int sca_no);
	// ca_no로 company list 조회
	List<ProductVO> companyListCa(int ca_no);


	List<ProductVO> randomProduct();

	
	//폐이징을 위한 메소드, 행의갯수
	
	List<ProductVO> productListPaging(Criteria cri);
	
	int selectRowCountPaging(Criteria cri);
	
	//////////////////////////////////////////////
	

}