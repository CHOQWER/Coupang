package com.ezen.biz;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.biz.dto.NoticeVO;
import com.ezen.biz.service.NoticeService;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class NoticeTest {
	@Autowired
	private NoticeService dao;
	
	@Test
	public void insertNotice() {
		NoticeVO vo=new NoticeVO();
		vo.setN_title("공지사항6");
		vo.setN_content("쿠팡공지사항6");
		vo.setType("0");
		dao.insertNotice(vo);
	}
	
	@Test
	public void updateNotice() {
		NoticeVO vo=new NoticeVO();
		vo.setN_title("공지사항6-1");
		vo.setN_content("쿠팡공지사항6-1");
		vo.setNno(12);
		dao.updateNotice(vo);
	}
	
	@Test
	public void deleteNotice() {
		NoticeVO vo=new NoticeVO();
		vo.setNno(12);
		dao.deleteNotice(vo);
	}
	
	@Test
	public void selectNoticeList() {
		NoticeVO vo=new NoticeVO();
		vo.setType("0");
		log.info(vo);
		dao.selectNoticeList(vo);
	}
	
	@Test
	public void getNoticeList() {
		NoticeVO vo=new NoticeVO();
		vo.setSearchKeyword("쿠팡");
		dao.getNoticeList(vo);
	}
}
