package com.ezen.biz;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.biz.dao.DeliveryDAO;
import com.ezen.biz.dao.ImagesDAO;
import com.ezen.biz.dao.ProductDAO;
import com.ezen.biz.dao.SellerDAO;
import com.ezen.biz.dto.DeliveryVO;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.dto.SalesVO;
import com.ezen.biz.dto.SubCateVO;
import com.ezen.biz.utils.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j
public class ProductTest {
	@Autowired
	private ProductDAO dao;

	@Autowired
	private ImagesDAO idao;
	
	@Autowired
	private DeliveryDAO ddao;

	@Autowired
	private SellerDAO sdao;
	
	@Test
	public void sellerGetPno() {
		ProductVO vo=new ProductVO();
		int pvo=dao.sellerGetPno();
		log.info(pvo);
		
	}
	
	@Test
	public void selectProductList() {
		dao.selectProductList();
	}
	

	@Test
	public void productSelectTest() {
		ProductVO vo = new ProductVO();

		vo.setCompany("삼성전자");
		vo.setPname("삼성전자 그랑데 드럼 세탁기 WF19T6000KW 19kg 방문설치");
		vo.setPrice(648000);
		dao.SelectProduct(vo);
	}

	@Test
	public void sellerinsertProductTest() {
			ProductVO vo=new ProductVO();
			vo.setCa_no(1);
			vo.setSca_no(1);
			vo.setCompany("삼성전자");
			vo.setU_id("whdgus1234");
			vo.setPname("종현 상품");
			vo.setPrice(1113);
			vo.setQty(10);
			dao.sellerInsertProduct(vo);
//
//		ImagesVO ivo = new ImagesVO();
//		ivo.setPno(1);
//		ivo.setMain_img1("bbb");
//		ivo.setCon_img_1("aaa");
//		idao.insertImages(ivo);
	}

	
//	  @Test public void sellerupdateProductTest() { ProductVO vo=new ProductVO();
//	  	vo.setPno(253); vo.setCa_no(1); vo.setSca_no(1); vo.setCompany("삼성전자");
//	  	vo.setU_id("whdgus1234"); vo.setPname("종현 상품"); vo.setPrice(2222);
//	  	vo.setQty(5); dao.sellerupdateProduct(vo); }
//	  
//	 @Test public void sellerdeleteProductTest() { ProductVO vo=new ProductVO();
//	 	vo.setPno(253); dao.sellerdeleteProduct(vo); }
//	
	


	
	@Test
	public void randomProduct() {
		List<ProductVO> list=dao.randomProduct();
		log.info("list"+list);
	}
	
	@Test
	public void insertDeli() {
		DeliveryVO vo=new DeliveryVO();
		vo.setU_id("thfk1234");
		vo.setU_name("영인");
		vo.setU_mobile("010");
		vo.setPost_no(200);
		vo.setAddr1("서울특별시");
		vo.setAddr2("관악구");
		int result=	ddao.insertDeli(vo);
		log.info(result);
	}
	@Test
	public void paging() {
		Criteria cri=new Criteria();
		cri.setCa_no(1);
		int result=dao.selectRowCountPaging(cri);
		log.info("result"+result);
	}
	
	@Test
	public void pagingList() {
		Criteria cri=new Criteria();
		cri.setCa_no(1);
		log.info("cri"+cri);
		List<ProductVO> result=dao.productListPaging(cri);
		log.info("result"+result);
	}
	
	
	@Test
	public void salesCate() {
		List<SalesVO> list=sdao.salesCate("thfk1234");
		log.info(list);
	}
	
	@Test
	public void pageTest() {
		Criteria cri=new Criteria();
		cri.setSca_no(0);
		cri.setCa_no(5);
		cri.setPageNum(6);
		List<ProductVO> list=dao.productListPaging(cri);
		log.info("list"+list);
		int result=dao.selectRowCountPaging(cri);
		log.info("result"+result);
	}

}

