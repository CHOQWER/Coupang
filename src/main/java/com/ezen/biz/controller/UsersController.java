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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.biz.dto.UsersVO;
import com.ezen.biz.service.UsersService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
//@RequestMapping()
public class UsersController {

	@Autowired
	private UsersService service;

	@Autowired
	private PasswordEncoder encoder;

	
	@GetMapping("/login")
	public String login() {
		return "users/login";
	}

	@PostMapping("/login")
	public String login(UsersVO vo, Model model, HttpServletRequest request) {
		UsersVO v = service.selectMember(vo.getU_id());
		if (v == null) {
			model.addAttribute("error", "유효하지 않는 아이디 입니다.");
			return "users/login";
		} else {// 패스워드 일치 확인
			if (encoder.matches(vo.getU_pwd(), v.getU_pwd())) {
				// 로그인 성공 --> 세션에 담기
				HttpSession session = request.getSession();
				session.setAttribute("vo", v);
				return "forward:/";
			} else {
				model.addAttribute("error", "패스워드가 다릅니다.");
				return "users/login";
			}

		}
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "forward:/";
	}

	@GetMapping("/register")
	public String register() {
		return "users/register";
	}

	@PostMapping("/register")
	public String register(UsersVO vo) {
		// db에 삽입작업-비밀번호 암호화 후
		log.info(vo);
		// 비밀번호 암호화
		vo.setU_pwd(encoder.encode(vo.getU_pwd()));
		service.insertMember(vo);
		return "users/login";
	}

	// 아이디 중복 검사
	@RequestMapping(value = "/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(@RequestParam("u_id") String id) {
		String result = "N";
		int flag = service.idCheck(id);
		if (flag == 1)
			result = "Y";
		return result;

	}

	// 마이 페이지
	@RequestMapping("/mypage")
	public String mypage(Model model, UsersVO vo, HttpServletRequest request) {	
		log.info(request.getSession());		
		HttpSession session=request.getSession();
		//log.info(session.getId());
		if (session.getAttribute("vo") == null) {
			return "users/login";
		} else {			
			vo=service.selectMember(request.getSession().getId());
			model.addAttribute("vo",vo);
			return "users/mypage";
		}		
	}

	// 회원정보 수정시 회원정보 재확인 화면
	@RequestMapping("/usercheck")
	public String userCheck(Model model, UsersVO vo, HttpServletRequest request) {
		HttpSession session=request.getSession();
		if (session.getAttribute("vo") == null) {
			return "forward:/";
		} else {			
			vo=service.selectMember(request.getSession().getId());
			model.addAttribute("vo",vo);
			return "users/usercheck";
		}	
		
	}
	// 회원정보 수정 페이지로 들어갈시 비밀번호 재확인
	@RequestMapping("/pwdcheck")
	public String pwdCheck() {
		return "users/userceck";
	}	
	
	// 회원정보 수정 페이지로 들어갈시 비밀번호 재확인
	@PostMapping("/pwdcheck")
	public String pwdCheck(UsersVO vo, Model model, HttpServletRequest request) {
		UsersVO v = service.selectMember(vo.getU_id());
		if (v == null) {
			model.addAttribute("error", "비밀번호를 입력해주세요");
			return "forward:/";
		} else {// 패스워드 일치 확인
			if (encoder.matches(vo.getU_pwd(), v.getU_pwd())) {
				// 패스워드 일치
				HttpSession session = request.getSession();
				session.setAttribute("vo", v);
				return "users/mypage";
			} else {
				model.addAttribute("error", "패스워드가 다릅니다.");
				return "users/usercheck";
			}

		}
	}
	
	

}
