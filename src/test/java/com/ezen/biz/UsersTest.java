package com.ezen.biz;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.biz.dao.UsersDAO;
import com.ezen.biz.dto.UsersVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class UsersTest {
	@Autowired
	private UsersDAO dao;
	@Autowired
	private PasswordEncoder encoder;
	//삽입 테스트 메소드
	@Test
	public void insertMTest() {
		log.info("테스트");
		
		UsersVO vo=new UsersVO();		
			vo.setU_id("admin");
			vo.setU_pwd(encoder.encode("1234"));
			vo.setU_name("관리자");
			vo.setU_identity("111111-1111111");
			vo.setU_mobile("010-0000-0000");
			vo.setU_email("ezen1@naver.com");
			vo.setU_post_no(0);
			vo.setU_addr1("서울시 관악구");
			vo.setU_addr2("신림동");
			//vo.setGrade(0);
			vo.setGrade("0");
			dao.insertMember(vo);
		}
	
	@Test
	public void selectMemberTest() {
		//로그인 기능
		UsersVO vo=new UsersVO();
		vo=dao.selectMember("종현1234");
		log.info("vo:"+vo);	
		if(vo!=null)
			if(encoder.matches("user4", vo.getU_pwd())) {
				log.info("로그인 성공");
			}else log.info("로그인 실패:비밀번호 다름");
		else log.info("로그인 실패:없는 아이디");
	}
	
	
	
	@Test
	public void register() {
		log.info("회원가입 테스트");
		UsersVO vo=new UsersVO();
		vo.setU_id("종현1234");
		vo.setU_pwd(encoder.encode("1234"));
		vo.setU_name("엄준식");
		vo.setU_identity("123456-1234567");
		vo.setU_mobile("010-1234-5678");
		vo.setU_email("um@gmail.com");
		vo.setU_post_no(12345);
		vo.setU_addr1("하길로70");			
		dao.insertMember(vo);
	}
	@Test
	public void updateMember() {
		UsersVO vo=new UsersVO();
		vo.setU_id("whdgus1234");
		vo.setU_pwd(encoder.encode("1234"));
		vo.setU_name("이종현");
		vo.setU_identity("123456-1234567");
		vo.setU_mobile("010-1234-5678");
		vo.setU_email("um@gmail.com");
		vo.setU_post_no(12345);
		vo.setU_addr1("하길로70");			
		dao.updateMember(vo);
		System.out.println(vo);
	}
}
