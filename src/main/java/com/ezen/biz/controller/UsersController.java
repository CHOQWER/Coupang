package com.ezen.biz.controller;

import java.io.Console;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

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

import com.ezen.biz.dao.ImagesDAO;
import com.ezen.biz.dto.BuyVO;
import com.ezen.biz.dto.ImagesVO;
import com.ezen.biz.dto.UsersVO;
import com.ezen.biz.service.ImagesService;
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
	
	@Autowired
	private ImagesService iservice;
	
	
	@GetMapping("/login")
	public String login() {
		return "users/login";
	}

	@PostMapping("/login")
	public String login(UsersVO vo, Model model, HttpServletRequest request, String grade) {
		UsersVO v = service.selectMember(vo.getU_id());
		if (v == null) {
			model.addAttribute("error", "유효하지 않는 아이디 입니다.");
			return "users/login";
		} else {
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

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "forward:/";
	}

	// 회원탈퇴
	@PostMapping("withdrawal")
	public String deleteUser(UsersVO vo, String u_id, HttpSession session) {
		service.deleteUser(vo.getU_id());
		System.out.println("탈퇴");
		session.invalidate();
		return "forward:/";
	}

	// 회원가입 페이지로 이동
	@RequestMapping("/register")
	public String register() {
		return "users/register";
	}

	// 회원가입+암호화
	@PostMapping("/register")
	public String register(UsersVO vo) {
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

	// 회원정보 수정 페이지들어가면 아이디, 비밀번호 재확인용
	@RequestMapping("/usercheck")
	public String userCheck(Model model, UsersVO vo, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("vo") == null) {
			return "forward:/";
		} else {
			vo = service.selectMember(request.getSession().getId());
			model.addAttribute("vo", vo);
			return "users/usercheck";
		}

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
				return "users/updatemypage";
			} else {
				model.addAttribute("error", "패스워드가 다릅니다.");
				return "users/usercheck";
			}
		}
	}

	// 마이 페이지 들어가기
	@GetMapping("/mypage")
	public String myPage(Model model, UsersVO vo, HttpServletRequest request, HttpSession session) {
		vo = (UsersVO) session.getAttribute("vo");
		if (vo == null) {
			model.addAttribute("error1", "로그인이 필요한 서비스입니다");
			return "users/login";
		} else {
			vo = (UsersVO) session.getAttribute("vo");
			service.selectMember(vo.getU_id());
			return "users/mypage";
		}
	}

	// 유저 정보 수정
	@PostMapping("updateUser")
	public String updateUser(UsersVO vo, HttpSession session) {
		service.updateUser(vo);
		// 데이터베이스에서 업데이트된 정보 다시 로드
		System.out.println("voooooooooooooooooooooo"+vo);		
		UsersVO updatedUser = service.selectMember(vo.getU_id());
		// 세션에 업데이트된 정보 저장
		session.setAttribute("vo", updatedUser);
		return "redirect:mypage";
	}

	@GetMapping("/membership")
	public String memberShip(UsersVO vo, HttpSession session, Model model) {
		vo=(UsersVO) session.getAttribute("vo");
		if (vo == null) {
			model.addAttribute("error1", "로그인이 필요한 서비스입니다");
			return "users/login";
		} else {
			service.selectMember(vo.getU_id());
			model.addAttribute("vo",vo);
			return "users/membership";
		}
		
	}

	// 와우 멤버십 가입
	@PostMapping("/membership")
	public String memberShip(UsersVO vo, HttpSession session) {
		vo=(UsersVO) session.getAttribute("vo");
		service.wowupdate(vo);
		UsersVO updatedUser = service.selectMember(vo.getU_id());
		session.setAttribute("vo", updatedUser);
		return "redirect:membership";
	}

	@RequestMapping("deliveryStatus")
	public String deliveryStatus(UsersVO vo, HttpSession session,Model model,
			HttpServletRequest request,BuyVO bvo,ImagesVO ivo) {
		vo=(UsersVO) session.getAttribute("vo");
		vo.setU_id(vo.getU_id());
		
		
		List<BuyVO> list=service.deliveryStatus(vo);
		System.out.println(list);

		 
		System.out.println("ccccccccccccccccccccccc");
		for(BuyVO v:list) {
			//v를 이용해서 pno 가저온다
			int pno=v.getPno();
			//pno를 가지고 이미지를 뽑아온다
			String main_img1=iservice.getThumbnailImage(pno);
			//이미기를 v 에다 setting한단
			v.setMain_img1(main_img1);		
			
		}

		model.addAttribute("list",list);
		
		//1일 뒤 도착예정
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		int month = now.get(Calendar.MONTH) + 1;
		int day = now.get(Calendar.DAY_OF_MONTH) + 2;

		String date = year + "." + month + "." + day;
		System.out.println("date=" + date);
		model.addAttribute("date", date);
		
		model.addAttribute("list", list);
		return "users/deliveryStatus";
	}			

	// 와우 멤버십 탈퇴
	@RequestMapping("wowsecession")
	public String wowsecession(UsersVO vo, HttpSession session) {
		service.wowsecess(vo);
		UsersVO updatedUser = service.selectMember(vo.getU_id());
		session.setAttribute("vo", updatedUser);
		return "redirect:membership";

	}
	
}
