package com.ezen.biz;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.biz.dao.BuyDAO;
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
		dao.refundProduct(vo);
		log.info(vo);
		
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
