package com.ezen.biz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.biz.dto.UsersVO;
import com.ezen.biz.service.UsersService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UsersController {
	@Autowired
	private PasswordEncoder encoder;
	@Autowired
	private UsersService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}

	@GetMapping("/login")
	public String login() {
		return "member/login";
	}

	@PostMapping("/login")
	public String login(UsersVO vo, Model model, HttpServletRequest request) {
		UsersVO v = service.selectMember(vo.getU_id());
		if (v == null) {
			model.addAttribute("error", "없는 아이디 입니다.");
			return "member/login";
		} else {// 패스워드 일치 확인
			if (encoder.matches(vo.getU_pwd(), v.getU_pwd())) {
				// 로그인 성공 --> 세션에 담기
				HttpSession session = request.getSession();
				session.setAttribute("u_id", v.getU_id());
				session.setAttribute("u_name", v.getU_name());
				session.setAttribute("grade", v.getGrade());
				return "member/memberHome";
			} else {
				model.addAttribute("error", "패스워드가 다릅니다.");
				return "member/login";
			}

		}
	}

	@RequestMapping("logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "member/login";
	}

	@GetMapping("register")
	public String register() {
		return "member/register";
	}

	@PostMapping("register")
	public String register(UsersVO vo) {
		// db에 삽입작업-비밀번호 암호화 후
		log.info(vo);
		// 비밀번호 암호화
		vo.setU_pwd(encoder.encode(vo.getU_pwd()));
		//id 중복 확인
		int result=service.idChk(vo);
		if(result==1) { // id가 중복이면 회원가입 페이지로
			return "/member/register";
		} else if(result==0) { //완료되면 로그인페이지로
			service.insertMember(vo);
		}		
		return "member/login";
	}
	
	// id 중복체크
	@ResponseBody
	@RequestMapping(value="/idCheck", method=RequestMethod.POST)
	public int idCheck(UsersVO vo) {
		int result=service.idChk(vo);
		return result;
	}
	 
	
}
