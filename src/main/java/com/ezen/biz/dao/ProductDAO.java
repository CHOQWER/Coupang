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
	
	// 제품 등록
	public void sellerInsertProduct(ProductVO vo) {
		mybatis.insert("ProductDAO.sellerInsertProduct", vo);
	}
	
	// 제품 수정
	public void sellerupdateProduct(ProductVO vo) {
		mybatis.update("ProductDAO.updateProduct", vo);
	}
	
	// 제품 삭제
	public void sellerdeleteProduct(ProductVO vo) {
		mybatis.delete("ProductDAO.deleteProduct", vo);
	}
	
	public List<ProductVO> selectProductList(){
		return mybatis.selectList("ProductDAO.selectProductList");
	}
	
	//pno로 상품정보 조회
		public ProductVO selectProductPno(int pno){
			return mybatis.selectOne("ProductDAO.selectProductPno",pno);
		}
	
	
	
	public ProductVO SelectProduct(ProductVO vo) {
		return mybatis.selectOne("ProductDAO.selectProduct", vo);
	}
	
	
	//서브 카테고리별로 제품 리스트
	public List<ProductVO> selectProductList(int sca_no, Criteria cri) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("sca_no", sca_no);
		map.put("pageNum", cri.getPageNum());
		map.put("rowsPerPage", cri.getRowsPerPage());
		return mybatis.selectList("ProductDAO.ProductListCate",map);
	}
	
	//메인 카테고리 리스트
	public List<MainCateVO> getCategory() {
		return mybatis.selectList("ProductDAO.getCategory");
	}
	
	//서브 카테고리 리스트(메인 카테고리 번호 받아서 조회)
	public List<SubCateVO> getSubCategory(int ca_no) {
		return mybatis.selectList("ProductDAO.getSubCategory",ca_no);
	}
	
	//서브 카테고리 클릭시 나오는 제품 총 수량(폐이징에 필요)
	public int selectRowCount(int sca_no) {
		return mybatis.selectOne("ProductDAO.selectRowCount",sca_no);
	}
	
	//이미지 전체 조회(pno 받아서)
		public ImagesVO selectImgPno(int pno) {
			return mybatis.selectOne("ProductDAO.selectImgPno",pno);
		}
	
}