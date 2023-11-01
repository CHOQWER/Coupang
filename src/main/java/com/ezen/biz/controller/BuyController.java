package com.ezen.biz.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.biz.dto.DeliveryVO;
import com.ezen.biz.service.BuyService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BuyController {
	
	 @Autowired
	   private BuyService service;
	  @Autowired
		private ProductService pservice;
	 @RequestMapping("delivery")
	 public String delivery(DeliveryVO vo,@RequestParam String u_id, Model model) {
		 List<DeliveryVO> dlist= service.selectDeli(u_id);
		 model.addAttribute("dlist",dlist);
		 return "users/delivery";
	 }
	 
	 @RequestMapping("selectDeli")
	 public String selectDeli(DeliveryVO vo,@RequestParam String u_id, Model model) {
		 List<DeliveryVO> dlist= service.selectDeli(u_id);
		 model.addAttribute("dlist",dlist);
		 return "users/selectdeli";
	 }
	 
	 @PostMapping("deleteDeli")
	 public String deleteDeli(@RequestParam int dno, @RequestParam String u_id, Model model) {
		 int result = service.deleteDeli(dno);
		 model.addAttribute("u_id", u_id);
		 return "forward:delivery";
	 }
	 
	 @GetMapping("insertDeli")
	 public String insertDeli() {
		return "users/insertdeli";
	 }
	 
	 @PostMapping("insertDeli")
	 public String insertDeli(DeliveryVO vo, @RequestParam String u_id, Model model) {
		 int result=service.insertDeli(vo);
		 return "forward:delivery";
	 }
	  @RequestMapping(value ="insertBuy")
	   public String insertBuy(BuyVO vo, HttpSession session, Model model, @RequestParam int c_cnt) {		 
		   log.info(c_cnt);
		   log.info("vo:"+vo);
	       UsersVO v = (UsersVO) session.getAttribute("vo");
	       log.info(v);
	       if (v == null) {
	           return "users/login";
	       } else {
	           ProductVO pvo = pservice.selectProductbuyPno(vo.getPno());
	           log.info("pvo="+pvo);
	           if (pvo != null) { // 상품이 존재하는 경우에만 처리
	               vo.setU_id(v.getU_id());
	               vo.setPname(pvo.getPname());
	               vo.setPrice(pvo.getPrice());
	               vo.setDis_price(pvo.getDis_price());
	               vo.setB_cnt(c_cnt);
	               vo.setPost_no(v.getU_post_no());
	               vo.setAddr1(v.getU_addr1());
	               vo.setAddr2(v.getU_addr2());
	               vo.setSta("r");

				  model.addAttribute("vo", vo); 
				  log.info("구매 완료 : "+vo);

	              service.insertBuy(vo); 	            
	      

	           }
	           return "buy/buy";
	       }
	   }

}
