package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.ProductDAO;
import com.ezen.biz.dto.ImagesVO;
import com.ezen.biz.dto.MainCateVO;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.dto.SubCateVO;
import com.ezen.biz.utils.Criteria;
@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDAO dao;
	
	@Override
	public int sellerGetPno() {
		return dao.sellerGetPno();
	}
	
	@Override
	public void sellerInsertProduct(ProductVO vo) {
		dao.sellerInsertProduct(vo);
	}
	
	@Override
	public void sellerUpdateProduct(ProductVO vo) {
		dao.sellerUpdateProduct(vo);
	}
	
	@Override
	public void sellerDeleteProduct(int pno) {
		dao.sellerDeleteProduct(pno);
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
	public List<MainCateVO> getCategory() {
		return dao.getCategory();
	}

	@Override
	public List<SubCateVO> getSubCategory(int ca_no) {
		return dao.getSubCategory(ca_no);
	}

	@Override
	public ProductVO selectProductPno(int pno) {
		return dao.selectProductPno(pno);
	}
	@Override
	public ProductVO selectProductcartPno(int pno) {
		return dao.selectProductcartPno(pno);
	}
	public ProductVO selectProductbuyPno(int pno) {
		return dao.selectProductbuyPno(pno);
	}
	@Override
	public ImagesVO selectImgPno(int pno) {
		return dao.selectImgPno(pno);
	}


	@Override
	public List<ProductVO> sellerSelectMineProduct(ProductVO vo) {
		return dao.sellerSelectMineProduct(vo);
	}
	@Override
	public List<ProductVO> randomProduct() {
		return dao.randomProduct();
	}

	
	
	//폐이징을 위한 메소드,행의갯수
	@Override
	public List<ProductVO> productListPaging(Criteria cri) {
		return dao.productListPaging(cri);
	}

	@Override
	public int selectRowCountPaging(Criteria cri) {
		return dao.selectRowCountPaging(cri);
	}
	///////////////////////////////////////////////////////////

	@Override
	public int selectRowCountCa(int ca_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ProductVO> companyListCa(int ca_no) {
		return dao.companyListCa(ca_no);
	}

	@Override
	public List<ProductVO> companyListSca(int sca_no) {
		return dao.companyListSca(sca_no);
	}






}
