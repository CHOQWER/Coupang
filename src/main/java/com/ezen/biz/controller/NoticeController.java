package com.ezen.biz.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.biz.dto.NoticeVO;
import com.ezen.biz.service.NoticeService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@GetMapping("notice")
	public String notice(Model model) {
		NoticeVO vo=new NoticeVO();
		if(vo.getType()==null || vo.getType()=="0") {
			vo.setType("0");
		}
		List<NoticeVO> list=service.selectNoticeList(vo);
		System.out.println(vo);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		return "admin/noticeList";
	}
	
	@GetMapping("noticeNew")
	public String insertNotice() {
		// 게시글 작성
		return "admin/noticeNew";
	}
	
	@PostMapping("noticeNew")
	public String insertNotice(NoticeVO vo) {
	    // 게시글 작성
		vo.setN_content(vo.getN_content().replace("\r\n", "<br>"));
	    service.insertNotice(vo);
	    return "redirect:notice";
	}
	
	@GetMapping("noticeUpdate")
	public String updateNotice(@RequestParam int nno, NoticeVO vo, Model model) {
		System.out.println(nno);
//		vo.setNno(nno);
		model.addAttribute("nno", nno);
		// 게시글 수정
		return "admin/noticeUpdate";
	}
	@PostMapping("noticeUpdate")
	public String updateNotice(NoticeVO vo) {
		System.out.println(vo);
	    // 공지사항 수정 작업
		vo.setN_content(vo.getN_content().replace("\r\n", "<br>"));
	    service.updateNotice(vo);
	    return "redirect:notice";
	}
	
	@GetMapping("deleteNotice")
	public String deleteNotice(@RequestParam("nno") int nno, NoticeVO vo) {
		log.info(nno);
		vo.setNno(nno);
	    service.deleteNotice(nno);
	    return "redirect:notice";
	}
	
	@GetMapping("faq")
	public String faq() {
		// 게시글 작성
		return "admin/faq";
	}

}
