package com.ezen.biz.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ezen.biz.dto.CartVO;

import com.ezen.biz.service.CartService;

import lombok.extern.log4j.Log4j;
@Controller
@Log4j
public class CartController {
	@Autowired
	private CartService service;
	@RequestMapping("insertCart")
	public String insertCart(CartVO vo, HttpSession session, Model model) {
		 String u_id = (String) session.getAttribute("u_id");
		   vo.setU_id(u_id);		
		String result=vo.getU_id();
		//로그인이 안되있으면 로그인 홈페이지로 
		// 삽입 장바구니 테이블에넣기
		if(result==null) {
			return "login";
		}else
			//사용자 아이디로 장바구니 조회 model에 담아서 page 이동
			service.insertCart(vo);
		model.addAttribute("vo.getU_id",vo.getU_id());
		model.addAttribute("vo.getMain_img1",vo.getMain_img1());
		model.addAttribute("vo.getPname",vo.getPname());
		model.addAttribute("vo.getPrice",vo.getPrice());
		model.addAttribute("vo.getDis_price",vo.getDis_price());
		model.addAttribute("vo.getC_cnt",vo.getC_cnt());	
		log.info(vo);
		return "cart";
	}	
	@RequestMapping(value = "/cartList")
	public String selectCartList(Model model, CartVO vo) {
		List<CartVO> list= service.selectCartList(vo);
		model.addAttribute("list", list);
		return "member/mainhome";
	}
	
}
