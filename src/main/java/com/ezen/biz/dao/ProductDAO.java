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

	// 서브 카테고리별로 제품 리스트
	public List<ProductVO> selectProductList(int sca_no, Criteria cri) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("sca_no", sca_no);
		map.put("pageNum", cri.getPageNum());
		map.put("rowsPerPage", cri.getRowsPerPage());
		return mybatis.selectList("ProductDAO.ProductListCate", map);
	}

	// 메인 카테고리 리스트
	public List<MainCateVO> getCategory() {
		return mybatis.selectList("ProductDAO.getCategory");
	}

	// 서브 카테고리 리스트(메인 카테고리 번호 받아서 조회)
	public List<SubCateVO> getSubCategory(int ca_no) {
		return mybatis.selectList("ProductDAO.getSubCategory", ca_no);
	}

	// 서브 카테고리 클릭시 나오는 제품 총 수량(폐이징에 필요)
	public int selectRowCount(int sca_no) {
		return mybatis.selectOne("ProductDAO.selectRowCount", sca_no);
	}
	
	

	// 이미지 전체 조회(pno 받아서)
	public ImagesVO selectImgPno(int pno) {
		return mybatis.selectOne("ProductDAO.selectImgPno", pno);
	}
	
	
	// 회사 전체 조회(sca_no 받아서)
	public List<ProductVO> selectCompany(int sca_no) {
			return mybatis.selectList("ProductDAO.selectCompany", sca_no);
	}
	
	public List<ProductVO> selectCompanyCa(int ca_no) {
		return mybatis.selectList("ProductDAO.selectCompany", ca_no);
}

	
	
	// 회사별 상품 전체 조회서
	public List<ProductVO> selectCompanylist(ProductVO vo, Criteria cri){
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sca_no", vo.getSca_no());
		map.put("company", vo.getCompany());
		map.put("pageNum", cri.getPageNum());
		map.put("rowsPerPage", cri.getRowsPerPage());
		return mybatis.selectList("ProductDAO.selectCompanylist", map);
	}
	
	// 회사 클릭시 나오는 제품 총 수량(폐이징에 필요)
		public int selectRowCount(ProductVO vo) {
			return mybatis.selectOne("ProductDAO.selectRowCountCompany", vo);
	}
	
	//메인 카테고리별 검색 리스트
		public List<ProductVO> selectMainCateList(int ca_no, Criteria cri) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("ca_no", ca_no);
			map.put("pageNum", cri.getPageNum());
			map.put("rowsPerPage", cri.getRowsPerPage());
			return mybatis.selectList("ProductDAO.selectMainCateList", map);
		}
		
	// 메인 카테고리 클릭시 나오는 제품 총 수량(폐이징에 필요)
		public int selectRowCountCa(int ca_no) {
			return mybatis.selectOne("ProductDAO.selectRowCountCa", ca_no);
	}
		
	//메인 카테고리 선택 후 검색어로 조회
		public List<ProductVO> selectSearchlist(ProductVO vo, Criteria cri){
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ca_no", vo.getCa_no());
			map.put("searchword", cri.getSearchword());
			map.put("pageNum", cri.getPageNum());
			map.put("rowsPerPage", cri.getRowsPerPage());
			return mybatis.selectList("ProductDAO.selectSearchlist", map);
		}
		
		
	// 메인 카테고리 선택 후 검색어로 조회 제품 총 수량(폐이징에 필요)
		public int selectRowCountword(int ca_no, Criteria cri) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("ca_no", ca_no);
			map.put("searchword", cri.getSearchword());
			return mybatis.selectOne("ProductDAO.selectRowCountword", map);
		}
		
	// 랜덤상품 10개
		public List<ProductVO> randomProduct() {
			return mybatis.selectList("ProductDAO.randomProduct");
		}	
		
		




}