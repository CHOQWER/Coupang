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
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezen.biz.dto.PaymentVO;
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
	public String index() {
		return "index";
	}
	
@GetMapping("/insertCard")
public String insertCard() {
	return "payment/main";
}

@PostMapping("/insertCard")
public String insertCard(PaymentVO vo, HttpSession session) {

    // 현재 로그인된 사용자의 아이디를 세션에서 가져오기
    String u_id = (String) session.getAttribute("u_id");
    vo.setU_id(u_id);
    log.info(vo);
    // 카드 비밀번호 암호화
    vo.setCard_pwd(encoder.encode(vo.getCard_pwd()));
    int result = service.cardChk(vo);

    if (result == 1) {// 카드번호가 중복이면 카드등록 페이지로
        return "payment/card";
    } else if (result == 0) {// 완료되면 메인페이지로
        service.insertCard(vo);
    }
    return "payment/main";
}
@ResponseBody
@RequestMapping(value="/cardCheck", method=RequestMethod.POST)
public int cardCheck(PaymentVO vo) {
	int result=service.cardChk(vo);
	return result;
}
@RequestMapping(value = "/cardList")
public String selectBookList(Model model, PaymentVO vo) {
	List<PaymentVO> list= service.selectCardList(vo);
	model.addAttribute("list", list);
	return "book/booklist";
}
}