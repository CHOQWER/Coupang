package com.ezen.biz.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezen.biz.dto.BuyVO;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.service.BuyService;
import com.ezen.biz.service.ProductService;

@Controller
public class SellerController {
	@Autowired
	private BuyService buyService;
	@Autowired
	private ProductService productService;
	
	@RequestMapping("seller")
	public String home() {
		return "seller/sellerHome";
	}
	
	@RequestMapping("sellerMainPage")
	public String sellerMainPage(Model model,BuyVO vo) {
		vo.setU_id("whdgus1234");
		List<BuyVO> list=buyService.sellerSelectBuyList(vo);
		model.addAttribute("list",list);
		return "seller/sellerMainPage";
	}
	@RequestMapping("adminSelectBuyList")
	public String adminSelectBuyList(Model model,BuyVO vo) {
		List<BuyVO> list=buyService.adminSelectBuyList(vo);
		model.addAttribute("list",list);
		return "admin/adminSelectBuyList";
	}
	@GetMapping("sellerInsertProduct")
	public String sellerInsertProduct1() {
		return "seller/sellerInsertProduct";
	}
	@PostMapping("sellerInsertProduct")
	public String sellerInsertProduct(Model model,ProductVO vo) {
		System.out.println("sellerInsertProduct 메소드 실행");
		productService.sellerInsertProduct(vo);
		System.out.println("sellerInsertProduct vo="+vo);
		return "seller/sellerHome";
	}

}
