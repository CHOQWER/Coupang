package com.ezen.biz.controller;

import java.util.List;

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

import com.ezen.biz.dto.DeliveryVO;
import com.ezen.biz.dto.PaymentVO;
import com.ezen.biz.dto.UsersVO;
import com.ezen.biz.service.PaymentService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class PaymentController {
	@Autowired
	private PasswordEncoder encoder;
	@Autowired
	private PaymentService service;

	@RequestMapping(value = "/payment", method = RequestMethod.GET)
	public String payment(Model model, HttpSession session, PaymentVO vo,UsersVO v) {
		// 세션에서 로그인 정보를 받아옵니다.
		v=(UsersVO) session.getAttribute("vo");
		vo.setU_id(v.getU_id());
		log.info(vo);
		List<PaymentVO> list = service.selectCardList(vo);
		// JSP 페이지로 리스트를 전달합니다.
		model.addAttribute("list", list);
		log.info(list);
		return "payment/payment";
	}
	@RequestMapping("cardselect")
	 public String selectDeli(DeliveryVO vo,@RequestParam String u_id, Model model) {
		 List<PaymentVO> list= service.cardselect(u_id);
		 model.addAttribute("list",list);
		 return "payment/cardselect";
	 }

	@GetMapping("/insertCard")
	public String insertCard() {
		return "payment/main";
	}

	@PostMapping("/insertCard")
	public String insertCard(Model model, PaymentVO vo, HttpSession session,PaymentVO vo1,UsersVO v) {
		v=(UsersVO) session.getAttribute("vo");
		vo1.setU_id(v.getU_id());
		log.info(vo1);
		// 카드 비밀번호 암호화
		vo1.setCard_pwd(encoder.encode(vo1.getCard_pwd()));
		int result = service.cardChk(vo1);

		if (result == 1) {// 카드번호가 중복이면 카드등록 페이지로
			model.addAttribute("error","이미 등록된 카드입니다");
			return "redirect:/payment";
			
		} else if (result == 0) {// 완료되면 메인페이지로
			service.insertCard(vo1);
		}
		return "redirect:/payment";
	}

	@ResponseBody
	@RequestMapping(value = "/cardCheck", method = RequestMethod.POST)
	public int cardCheck(PaymentVO vo) {
		int result = service.cardChk(vo);
		return result;
	}

	@RequestMapping(value = "/cardList")
	public String selectCardList(Model model, HttpSession session, PaymentVO vo) {
		// 세션에서 로그인 정보를 받아옵니다.
		vo.setU_id(session.getId());
		List<PaymentVO> list = service.selectCardList(vo);
		// JSP 페이지로 리스트를 전달합니다.
		model.addAttribute("list", list);
		log.info(list);
		return "payment/payment";
//	List<PaymentVO> list= service.selectCardList(vo);
//	model.addAttribute("list", list);
//	return "payment/list";
	}
	@PostMapping("/deleteCard")
	public String deleteCard(Model model, HttpSession session, @RequestParam(value="card_num",required=false) String card_num,
			PaymentVO vo,UsersVO v) {
		v=(UsersVO) session.getAttribute("vo");
		vo.setU_id(v.getU_id());
	    vo.setCard_num(card_num);
	    
	    // 카드 삭제를 수행
	    int result = service.deleteCard(vo);
	    if (result == 1) {
	        // 삭제 성공 시 메시지를 전달할 수 있습니다.
	        model.addAttribute("success", "카드가 성공적으로 삭제되었습니다.");
	}
	    return "redirect:/payment";
	}
	
	
	
	
}