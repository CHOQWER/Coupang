package com.ezen.biz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		NoticeVO vo = new NoticeVO();
		if(vo.getType()==null) {
			vo.setType("0");
		}
		List<NoticeVO> list=service.selectNoticeList(vo);
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		return "admin/noticeList";
	}
	
	@GetMapping(value = "noticeNew")
	public String insertNotice() {
		// 게시글 작성
		return "admin/noticeNew";
	}
	@PostMapping(value = "noticeNew")
	public String insertNotice(NoticeVO vo) {
		// 게시글 작성
		service.insertNotice(vo);
		return "redirect:notice?type=" + vo.getType();
	}
	
	@RequestMapping(value = "/updateNotice.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String updateNotice(@ModelAttribute("notice") NoticeVO vo) {
		// 공지사항 수정 작업
		service.updateNotice(vo);
		return "redirect:noticeList.do?nno="+vo.getNno();
	}
		
	@GetMapping("/deleteNotice.do")
	public String deleteNotice(@RequestParam("nno") int nno) {
		//게시글 삭제 작업
		NoticeVO vo = new NoticeVO();
	    vo.setNno(nno);
	    service.deleteNotice(vo);
	    return "redirect:notice?type=" + vo.getType();
	}

}
