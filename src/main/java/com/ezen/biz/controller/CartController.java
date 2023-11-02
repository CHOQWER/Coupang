package com.ezen.biz.controller;


import java.util.List;


import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.biz.dao.ImagesDAO;
import com.ezen.biz.dto.CartVO;
import com.ezen.biz.dto.ImagesVO;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.dto.UsersVO;
import com.ezen.biz.service.CartService;
import com.ezen.biz.service.ImagesService;
import com.ezen.biz.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j

public class CartController {
	@Autowired
	private CartService service;
	@Autowired
	private ProductService pservice;
	@Autowired
	private ImagesService iservice;
	
	
//	private final String imgPath = "D:/upload/coupang/";
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(Model model, HttpSession session, CartVO vo, UsersVO v, ProductVO pvo) {
	    // 세션에서 로그인 정보를 받아옵니다.
	    v = (UsersVO) session.getAttribute("vo");
	    if (v == null) {
	        model.addAttribute("error1", "로그인이 필요한 서비스입니다");
	        return "users/login";
	    } else {
	        vo.setU_id(v.getU_id());
	        List<CartVO> list = service.selectCartList(vo);
	        log.info(list);
	        // JSP 페이지로 리스트를 전달합니다.
	        model.addAttribute("list", list);
	        
	        return "cart/cart";
	    }
	}

	@RequestMapping("insertCart")
	public String insertCart(CartVO vo, HttpSession session, Model model,
			@RequestParam int pno,ImagesVO ivo) {
		System.out.println("pno="+pno);
		
	    UsersVO v = (UsersVO) session.getAttribute("vo");
	    // 사용자 아이디로 장바구니 조회 model에 담아서 page 이동
	    // 로그인이 안되있으면 로그인 홈페이지로
	    if (v == null) {
	        return "users/login";
	    }
	    
	    // CartVO에 있는 pno를 이용해서 product 테이블에서 필요한 데이터 조회
	    ProductVO pvo = pservice.selectProductcartPno(vo.getPno());
	    System.out.println("pvo="+pvo);
	    // CartVO에 세팅
	    vo.setU_id(v.getU_id());
	    vo.setMain_img1(pvo.getMain_img1());
	    vo.setPname(pvo.getPname());
	    vo.setPrice(pvo.getPrice());
	    vo.setDis_price(pvo.getDis_price());
	    if(vo.getC_cnt()==0) {
	    	vo.setC_cnt(1);
	    }
	    
	    //images 테이블에서 pno를 주고 ino를 가져와서 세팅
	    List<ImagesVO> ino=iservice.pullIno(pno);
	    for(ImagesVO i:ino) {
	    vo.setIno(i.getIno());
	    System.out.println("ino="+ino);
	    }
	    // 삽입 장바구니 테이블에 넣기
	    int cno = service.insertCart(vo);
	    
	    
	    // cno로 cart 테이블에서 조회
	    List<CartVO> list = service.selectCartList(vo);
	    model.addAttribute("list", list);
	    
	    return "cart/cart";
	}
	/*
	 * @PostMapping("/deleteCart") public String deleteCard(Model model, HttpSession
	 * session, @RequestParam(value="cno",required=false) int cno, CartVO vo,UsersVO
	 * v) { v=(UsersVO) session.getAttribute("vo"); vo.setU_id(v.getU_id());
	 * vo.setCno(cno);
	 * 
	 * // 카드 삭제를 수행 int result = service.deleteCart(vo); if (result == 1) { // 삭제 성공
	 * 시 메시지를 전달할 수 있습니다. model.addAttribute("success", "선택된 상품이 성공적으로 삭제되었습니다."); }
	 * return "redirect:/cart"; }
	 */
	@RequestMapping("deleteCart")
	public String deleteCard(Model model, HttpSession session, @RequestParam(value="cnolist", required=false) int[] cnolist, CartVO vo, UsersVO v) {
	    v = (UsersVO) session.getAttribute("vo");
	    vo.setU_id(v.getU_id());
	    
	    // 선택된 항목들을 반복하면서 삭제
	    for (int cno : cnolist) {
	        vo.setCno(cno);
	        // 카트 삭제를 수행
	        int result = service.deleteCart(vo);
	        if (result != 1) {
	            // 삭제 실패 시 메시지를 전달할 수 있습니다.
	            model.addAttribute("error", "장바구니 상품 삭제 중 오류가 발생했습니다.");
	        }
	    }
	    
	    return "redirect:/cart";
	}
}
            
   


