package com.ezen.biz.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.ImagesVO;
import com.ezen.biz.dto.MainCateVO;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.dto.SubCateVO;
import com.ezen.biz.utils.Criteria;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	// 제품등록후 제품번호 받아오기
	public int sellerGetPno() {
		return mybatis.selectOne("ProductDAO.sellerGetPno");
	}

	// 제품 등록
	public void sellerInsertProduct(ProductVO vo) {
		mybatis.insert("ProductDAO.sellerInsertProduct", vo);
	}

	// 제품 수정
	public void sellerUpdateProduct(ProductVO vo) {
		mybatis.update("ProductDAO.sellerUpdateProduct", vo);
	}

	// 제품 삭제
	public void sellerDeleteProduct(int pno) {
		mybatis.delete("ProductDAO.sellerDeleteProduct", pno);
	}

	// 전체 상품 목록 조회
	public List<ProductVO> selectProductList() {
		return mybatis.selectList("ProductDAO.selectProductList");
	}

	// 판매자 상품등록 내역조회
	public List<ProductVO> sellerSelectMineProduct(ProductVO vo) {
		return mybatis.selectList("ProductDAO.sellerSelectMineProduct", vo);
	}

	// pno로 상품정보 조회
	public ProductVO selectProductPno(int pno) {
		return mybatis.selectOne("ProductDAO.selectProductPno", pno);
	}
	//상품페이지에서 장바구니로 넘기기
	public ProductVO selectProductcartPno(int pno) {
		System.out.println("selectProductcartpno");
		return mybatis.selectOne("ProductDAO.selectProductcartPno", pno);
	}
	public ProductVO SelectProduct(ProductVO vo) {
		return mybatis.selectOne("ProductDAO.selectProduct", vo);
	}
	
	// 메인 카테고리 리스트
	public List<MainCateVO> getCategory() {
		return mybatis.selectList("ProductDAO.getCategory");
	}

	// 서브 카테고리 리스트(메인 카테고리 번호 받아서 조회)
	public List<SubCateVO> getSubCategory(int ca_no) {
		return mybatis.selectList("ProductDAO.getSubCategory", ca_no);
	}

	// 이미지 전체 조회(pno 받아서)
	public ImagesVO selectImgPno(int pno) {
		return mybatis.selectOne("ProductDAO.selectImgPno", pno);
	}
	
	// sca_no로 company list 조회
	public List<ProductVO> companyListSca(int sca_no) {
			return mybatis.selectList("ProductDAO.companyListSca", sca_no);
	}
	// ca_no로 company list 조회
	public List<ProductVO> companyListCa(int ca_no) {
		return mybatis.selectList("ProductDAO.companyListCa", ca_no);
	}

	public ProductVO selectProductbuyPno(int pno) {
			return mybatis.selectOne("ProductDAO.selectProductbuyPno", pno);
		}
		
	// 랜덤상품 10개
		public List<ProductVO> randomProduct() {
			return mybatis.selectList("ProductDAO.randomProduct");
		}	
		
		
	//페이징을 위한 메소드
		public List<ProductVO> productListPaging(Criteria cri){
			return mybatis.selectList("ProductDAO.productListPaging", cri);
		}
	//페이징을 위한 행 개수 구하기
		public int selectRowCountPaging(Criteria cri) {
			return mybatis.selectOne("ProductDAO.selectRowCountPaging", cri);
		}




}