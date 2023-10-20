package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.ProductDAO;
import com.ezen.biz.dto.MainCateVO;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.dto.SubCateVO;
import com.ezen.biz.utils.Criteria;
@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDAO dao;
	
	@Override
	public void sellerInsertProduct(ProductVO vo) {
		dao.sellerInsertProduct(vo);
	}
	
	@Override
	public void sellerupdateProduct(ProductVO vo) {
		dao.sellerupdateProduct(vo);
	}
	
	@Override
	public void sellerdeleteProduct(ProductVO vo) {
		dao.sellerdeleteProduct(vo);
	}

	@Override
	public List<ProductVO> selectProductList() {
		return dao.selectProductList();
	}
	
	@Override
	public ProductVO SelectProduct(ProductVO vo) {
		return dao.SelectProduct(vo);
	}

	@Override
	public List<ProductVO> selectProductList(int sca_no, Criteria cri) {
		return dao.selectProductList(sca_no, cri);
	}

	@Override
	public List<MainCateVO> getCategory() {
		return dao.getCategory();
	}

	@Override
	public List<SubCateVO> getSubCategory(int ca_no) {
		return dao.getSubCategory(ca_no);
	}

	@Override
	public int selectRowCount(int sca_no) {
		return dao.selectRowCount(sca_no);
	}

	@Override
	public List<ProductVO> selectProductListPno(int pno) {
		return dao.selectProductListPno(pno);
	}

}
