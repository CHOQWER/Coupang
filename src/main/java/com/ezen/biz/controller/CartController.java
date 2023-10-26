package com.ezen.biz.controller;

import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.biz.dao.ProductDAO;
import com.ezen.biz.dto.CartVO;
import com.ezen.biz.dto.ImagesVO;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.dto.UsersVO;
import com.ezen.biz.service.CartService;
import com.ezen.biz.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CartController {
	@Autowired
	private CartService service;
	@Autowired
	private ProductService pservice;

//	private final String imgPath = "D:/upload/coupang/";
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cart(Model model, HttpSession session, CartVO vo, UsersVO v) {
		// 세션에서 로그인 정보를 받아옵니다.
		v = (UsersVO) session.getAttribute("vo");
		if (v == null) {
			model.addAttribute("error1", "로그인이 필요한 서비스입니다");
			return "users/login";
		} else {
			vo.setU_id(v.getU_id());
			List<CartVO> list = service.selectCartList(vo);
	
			// JSP 페이지로 리스트를 전달합니다.
			model.addAttribute("list", list);
			return "cart/cart";
		}
	}

	@RequestMapping("insertCart")
	public String insertCart(CartVO vo, HttpSession session, Model model) {
		UsersVO v = (UsersVO) session.getAttribute("vo");
		// 사용자 아이디로 장바구니 조회 model에 담아서 page 이동
		// 로그인이 안되있으면 로그인 홈페이지로
		if (v == null) {
			return "users/login";
		}
		// CartVO 에 있는 pno를 이용해서 product테이블에서 필요한거 조회
		ProductVO pvo = pservice.selectProductcartPno(vo.getPno());
		
		log.info("---------------" + pvo);
		// CartVO 에 세팅
		vo.setU_id(v.getU_id());
		vo.setMain_img1(pvo.getMain_img1());
		vo.setPname(pvo.getPname());
		vo.setPrice(pvo.getPrice());
		vo.setDis_price(pvo.getDis_price());
		log.info("----"+vo);
	
		// 삽입 장바구니 테이블에넣기
		int cno = service.insertCart(vo);
		// cno로 cart테이블에서 조회함
		// 조회해서 model에 담아서 보냄
		model.addAttribute("cno", cno);
		return "cart/cart";
	}

//	@RequestMapping(value = "/cartList")
//	public String selectCartList(Model model, CartVO vo) {
//		List<CartVO> list = service.selectCartList(vo);
//		model.addAttribute("list", list);
//		return "member/mainhome";
//	}
//	/*
//	 * @GetMapping("imgDown") public void imgDown(@RequestParam String imgName,
//	 * HttpServletRequest request, HttpServletResponse response) throws IOException
//	 * { // 파라메타값 받아오기 // 저장되어 있는 파일명 : filename -앞37자리 uuid String pathFilename =
//	 * imgPath + imgName;
//	 * 
//	 * // 이미지를 다른이름으로 다운로드할 때 uuid제외한 파일명 수정 // 웹브라우저의 종류 확인 String agent =
//	 * request.getHeader("User-Agent"); // ie 7 또는 edge boolean ieBrowser =
//	 * (agent.indexOf("Trident") > -1) || (agent.indexOf("Edge") > -1); if
//	 * (ieBrowser) { imgName = URLEncoder.encode(imgName,
//	 * "utf-8").replace("\\", "%20");
//	 * 
//	 * } else {// edge, 파이어폭스, 크롬 imgName = new String(imgName.getBytes("utf-8"),
//	 * "iso-8859-1");
//	 * 
//	 * } response.setContentType("image/jpg"); // 다운로드 되는 파일명 설정
//	 * response.setHeader("Content-Disposition", "attachment;filename=" + imgName);
//	 * FileInputStream in = new FileInputStream(pathFilename);// 파일 open // 출력할 곳
//	 * BufferedOutputStream out = new
//	 * BufferedOutputStream(response.getOutputStream()); int numRead; byte b[] = new
//	 * byte[4096];// 4K만큼 while ((numRead = in.read(b, 0, b.length)) != -1) {
//	 * out.write(b, 0, numRead); } // end while out.flush();// 버퍼에 남은것 출력
//	 * in.close(); out.close(); }
//	 */

	}

