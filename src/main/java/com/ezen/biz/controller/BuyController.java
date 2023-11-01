package com.ezen.biz.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

import java.util.List;

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
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 

}
