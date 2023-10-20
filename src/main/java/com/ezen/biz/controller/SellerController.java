package com.ezen.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.biz.dto.BuyVO;
import com.ezen.biz.service.BuyService;
import com.ezen.biz.service.ProductService;

@Controller
public class SellerController {
	@Autowired
	private BuyService buyService;
	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/seller", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping("/sellerMainPage")
	public String sellerMainPage(Model model,BuyVO vo) {
	System.out.println("aaa");
		vo.setU_id("whdgus1234");
	System.out.println(vo);
		List<BuyVO> list=buyService.sellerSelectBuyList(vo);
	System.out.println(vo);
		model.addAttribute("list",list);
	System.out.println("list : "+list);
		return "sellerMainPage";
	}
	@RequestMapping("/adminSelectBuyList")
	public String adminSelectBuyList(Model model,BuyVO vo) {
		List<BuyVO> list=buyService.adminSelectBuyList(vo);
		model.addAttribute("list",list);
		return "adminSelectBuyList";
	}
	
}
