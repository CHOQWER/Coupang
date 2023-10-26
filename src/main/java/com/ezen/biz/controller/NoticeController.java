package com.ezen.biz.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.biz.dto.NoticeVO;
import com.ezen.biz.dto.UsersVO;
import com.ezen.biz.service.NoticeService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class NoticeController {
	// 태근
	@Autowired
	private NoticeService service;
	
	@GetMapping("notice")
	public String notice(NoticeVO vo, Model model) {
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
	
	@RequestMapping("/updateNotice.do")
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
