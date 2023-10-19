package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.ProductDAO;
import com.ezen.biz.dto.ProductVO;
@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDAO dao;
	
	@Override
	public void insertProduct(ProductVO vo) {
		dao.insertProduct(vo);
	}
	
	@Override
	public void updateProduct(ProductVO vo) {
		dao.updateProduct(vo);
	}
	
	@Override
	public void deleteProduct(ProductVO vo) {
		dao.deleteProduct(vo);
	}

	@Override
	public List<ProductVO> selectProductList() {
		return dao.selectProductList();
	}
	
	@Override
	public ProductVO SelectProduct(ProductVO vo) {
		return dao.SelectProduct(vo);
	}

}
