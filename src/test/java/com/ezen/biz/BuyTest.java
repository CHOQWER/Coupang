package com.ezen.biz;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.biz.dao.BuyDAO;
import com.ezen.biz.dao.ImagesDAO;
import com.ezen.biz.dao.ProductDAO;
import com.ezen.biz.dto.BuyVO;
import com.ezen.biz.dto.ProductVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class BuyTest {
	@Autowired
	private BuyDAO dao;
	@Autowired
	private ProductDAO pdao;

	
	
	@Test
	private void insert22() {
		ProductVO pvo=new ProductVO();
		pvo.setU_id("whdgus1234");
		pvo.setCa_no(1);
		pvo.setSca_no(1);
		pvo.setCompany("삼성");
		pvo.setPname("종현");
		pvo.setPrice(3);
		pvo.setQty(10);
		pdao.sellerInsertProduct(pvo);
		

//		ImagesVO ivo=new ImagesVO();
//		ivo.setPno(1);
//		ivo.setCon_img_1("aaa");
//		ivo.setMain_img1("bbb");
//		idao.insertImages(ivo);	
	}
	
	@Test
	public void insertBuy() {
		BuyVO vo=new BuyVO();
		vo.setU_id("whdgus1234");
		vo.setPno(170);
		vo.setPname("넷플릭스 유튜브 32인치 HD 스마트TV 안드로이드11 스마트티비");
		vo.setPrice(10000);
		vo.setDis_price(1000);
		vo.setB_cnt(1);
		vo.setPost_no(0);
		vo.setAddr1("서울시 관악구");
		vo.setAddr2("신림동");
		dao.insertBuy(vo);
		
	}
	
	
	
	@Test
	public void buyProductTest() {
		BuyVO vo=new BuyVO();
		vo.setU_id("whdgus1234");
		vo.setPno(170);
		
		ProductVO pvo=new ProductVO();
		pvo.setPno(vo.getPno());
		pvo=pdao.SelectProduct(pvo);
		
		vo.setPname(pvo.getPname());
		vo.setPrice(pvo.getPrice());
		vo.setDis_price(648001);
		vo.setAddr1("서울시 관악구");
		vo.setAddr2("대림동");
		
	}
	
	@Test
	public void refundProduct() {
		BuyVO vo=new BuyVO();
		vo.setBno(1);
		dao.refundProduct(vo);
	}
	@Test
	public void adminSelectBuyList() {
		BuyVO vo= new BuyVO();
		dao.adminSelectBuyList(vo);
		
		log.info(vo);
	}
	@Test
	public void sellerSelectBuyList() {
		BuyVO vo= new BuyVO();
		vo.setU_id("whdgus1234");
		dao.sellerSelectBuyList(vo);
		log.info(vo);
	}
}
