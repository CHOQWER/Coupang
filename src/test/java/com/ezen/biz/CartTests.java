package com.ezen.biz;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.biz.dao.CartDAO;
import com.ezen.biz.dto.CartVO;

import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class CartTests {
	@Autowired
	private CartDAO dao;
	@Test
	public void insertCartTest() {
		log.info("테스트");
		//MemberVO 객체 생성, 패스워드 암호화 저장
		CartVO vo=new CartVO();	
			vo.setCno(2);
			vo.setIno(1);
			vo.setU_id("rhksdyd1234");
			vo.setPno(3);
			vo.setMain_img1("이미지3");
			vo.setPname("LG 노트북");
			vo.setPrice(1430000);
			vo.setDis_price(9900000);
			vo.setC_cnt(2);			
			dao.insertCart(vo);
		}
	@Test
	public void selectCartList() {
		CartVO vo= new CartVO();
		vo.setU_id("user2");
		List<CartVO> list=dao.selectCartList(vo);
		log.info(list);
		
	}
}
