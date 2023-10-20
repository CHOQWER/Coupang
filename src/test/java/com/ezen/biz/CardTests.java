package com.ezen.biz;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.biz.dao.PaymentDAO;
import com.ezen.biz.dto.PaymentVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class CardTests {
	@Autowired
	private PaymentDAO dao;
	@Autowired
	private PasswordEncoder encoder;
	//삽입 테스트 메소드
	@Test
	public void insertCardTest() {
		log.info("테스트");
		//MemberVO 객체 생성, 패스워드 암호화 저장
		PaymentVO vo=new PaymentVO();		
			vo.setCard_num("1413-1234-1222-2521");
			vo.setU_id("rhksdyd1234");
			vo.setCvc(174);
			vo.setCard_date("09-01");
			vo.setCard_pwd(encoder.encode("1234"));
			dao.insertCard(vo);
		}
	@Test
	public void selectCardAll() {
		PaymentVO vo=new PaymentVO();
		vo.setU_id("rhksdyd1234");
		List<PaymentVO> list=dao.selectCardList(vo);
		log.info("-------------------------------");
		log.info(list);
	}
}
