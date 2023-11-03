package com.ezen.biz.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.biz.dto.BuyVO;
import com.ezen.biz.dto.CartVO;
import com.ezen.biz.dto.DeliveryVO;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.dto.UsersVO;
import com.ezen.biz.service.BuyService;
import com.ezen.biz.service.CartService;
import com.ezen.biz.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class BuyController {
	
	 @Autowired
	   private BuyService service;
	  @Autowired
		private ProductService pservice;
	  @Autowired
		private CartService cservice;
	  
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
//	  @RequestMapping(value ="insertBuy")
//	   public String insertBuy(BuyVO vo, HttpSession session, Model model, @RequestParam int c_cnt) {		 
//		   log.info(c_cnt);
//		   log.info("vo:"+vo);
//	       UsersVO v = (UsersVO) session.getAttribute("vo");
//	       log.info(v);
//	       if (v == null) {
//	           return "users/login";
//	       } else {
//	           ProductVO pvo = pservice.selectProductbuyPno(vo.getPno());
//	           log.info("pvo="+pvo);
//	           if (pvo != null) { // 상품이 존재하는 경우에만 처리
//	               vo.setU_id(v.getU_id());
//	               vo.setPname(pvo.getPname());
//	               vo.setPrice(pvo.getPrice());
//	               vo.setDis_price(pvo.getDis_price());
//	               vo.setB_cnt(c_cnt);
//	               vo.setPost_no(v.getU_post_no());
//	               vo.setAddr1(v.getU_addr1());
//	               vo.setAddr2(v.getU_addr2());
//	               vo.setSta("r");
//
//				  model.addAttribute("vo", vo); 
//				  log.info("구매 완료 : "+vo);
//
//	              service.insertBuy(vo); 	            
//	      
//
//	           }
//	           return "buy/buy";
//	       }
//	   }
	 	@RequestMapping(value ="insertBuy")
	   public String insertBuy(BuyVO vo, HttpSession session, Model model,UsersVO v,CartVO cvo,
			   ProductVO pvo,@RequestParam int[] pno,@RequestParam int[] cno,@RequestParam String[] pname,
			   @RequestParam String[] main_img1,@RequestParam int[] c_cnt,
			   @RequestParam int[] price,@RequestParam int[] dis_price) {
	 		
			v=(UsersVO) session.getAttribute("vo");
			vo.setU_id(v.getU_id());
	 		
	 		for(int i=0;i<pno.length;i++) {
	 			//insert 
	 			vo.setPno(pno[i]);
	 			vo.setPname(pname[i]);
	 			
	 			vo.setB_cnt(c_cnt[i]);
	 			vo.setPrice(price[i]);
	 			vo.setDis_price(dis_price[i]);
	 			
	 			
	 			//delete
	 			cvo.setCno(cno[i]);
	 			
	 			
				cservice.deleteCart(cvo);
				
	 			service.insertBuy(vo);
	 			
	 			
	 		}
	 		
	 		
	 		System.out.println("pno "+pno);
	 		System.out.println("cno "+cno);
		    System.out.println("---------구매-----------------");
	 		System.out.println("BuyVO "+vo);
	 		System.out.println("UsersVO "+vo);
	 		System.out.println("ProductVO "+pvo);
	 		
	 		
		return "users/deliveryStatus";	
	 	}
	 
	 
	 
	   @RequestMapping("refundBuyProduct")
	   public String refundBuyProduct(@RequestParam int bno) {
		   service.refundBuyProduct(bno);
		   System.out.println(bno);
		return "redirect:deliveryStatus";
		   
	   }
	   @PostMapping("cartbuy")
		  public String cartbuy(CartVO cvo,@RequestParam int[] deleteCart,@RequestParam int[] c_cnt, 
				  Model model) {
		   //List<CartVO> vo
		   List<CartVO> vo=new ArrayList<CartVO>();
		   
		   for(int i=0;i<deleteCart.length;i++) {
			   System.out.println("deleteCart="+deleteCart[i]);
			   System.out.println("c_cnt="+c_cnt[i]);

			   cvo.setCno(deleteCart[i]);
			   cvo.setC_cnt(c_cnt[i]);
			   
			   cservice.updateCnt(cvo);
			   
			   
			  vo.add(cservice.checkselectCart(cvo));
			   
			   model.addAttribute("vo",vo);
			   
		   }  

			return "buy/buy";
			  
		  }

}
