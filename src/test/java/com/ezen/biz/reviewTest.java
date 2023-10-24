package com.ezen.biz;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.service.ReviewService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml" })
@Log4j
public class reviewTest {
	@Autowired
	private ReviewService dao;


	@Test
	public void reviewInsert() {
		ReviewVO vo=new ReviewVO();
		vo.setPno(1);
		vo.setR_content("맘에 들어요");
		vo.setR_title("이 상품 추천");
		vo.setScore(4.5);
		vo.setU_id("thfk1234");
		dao.insertReview(vo);
	}


}



