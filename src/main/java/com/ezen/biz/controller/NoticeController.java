package com.ezen.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.biz.dto.NoticeVO;
import com.ezen.biz.service.NoticeService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@RequestMapping("notice")
	public String notice(NoticeVO vo, Model model) {
		log.info(vo);
		if(vo.getType()==null || vo.getType().equals("0")) {
			vo.setType("0");
		}else if ( vo.getType().equals("1")) {
			vo.setType("1");
		}
		List<NoticeVO> list=service.selectNoticeList(vo);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		return "admin/noticeList";
	}
	
	@RequestMapping(value = "noticeNew", method = RequestMethod.GET)
	public String insertNotice() {
		// 게시글 작성
		return "admin/noticeNew";
	}
	@RequestMapping(value = "noticeNew", method = RequestMethod.POST)
	public String insertNotice(NoticeVO vo) {
	    // 게시글 작성
	    String type = vo.getType();
	    // type을 이용하여 데이터 처리 또는 조건부 처리
	    if ("0".equals(type)) {
	    	service.insertNotice(vo);
	    } else if ("1".equals(type)) {
			/* service.insertFAQ(vo); */
	    }
	    return "redirect:notice";
	}
	
	@RequestMapping(value = "/updateNotice.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateNotice(@ModelAttribute("notice") NoticeVO vo) {
		// 공지사항 수정 작업
		service.updateNotice(vo);
		return "redirect:noticeList.do?nno="+vo.getNno();
	}
		
	@RequestMapping(value = "/deleteNotice.do")
	public String deleteNotice(NoticeVO vo) {
		//게시글 삭제 작업
		service.deleteNotice(vo);//삭제작업
		return "forward:noticeList.do";
	}

}
