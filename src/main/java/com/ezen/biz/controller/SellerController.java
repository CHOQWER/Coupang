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
		return "seller/adminSelectBuyList";
	}
	@GetMapping("sellerInsertProduct")
	public String sellerInsertProduct() {
		return "seller/sellerInsertProduct";
	}
	@PostMapping("sellerInsertProduct")
	public String sellerInsertProduct(Model model,ProductVO vo) {
		productService.sellerInsertProduct(vo);
		return "seller/sellerHome";
	}
	// 판매자 상품등록 내역조회
	@RequestMapping("sellerSellectMineProduct")
	public String sellerSelectProduct(Model model,ProductVO vo) {
		vo.setU_id("whdgus1234");
		System.out.println("aaa");
		List<ProductVO> list=productService.sellerSellectMineProduct(vo);
		System.out.println(vo);
		model.addAttribute("list",list);
		return "seller/sellerSellectMineProduct";
	}
	//판매자 업데이트 팝업창 이동
	@GetMapping("sellerUpdateProduct")
	public String sellerUpdateProduct() {
		return "seller/sellerUpdateProduct";
	}
	//판매자 업데이트 팝업창 이동
	@PostMapping("sellerUpdateProduct")
	public String sellerUpdateProduct(Model model,ProductVO vo) {
		vo.setU_id("whdgus1234");
		productService.sellerUpdateProduct(vo);
		model.addAttribute("vo",vo);
		return "seller/sellerHome";
	}
}
