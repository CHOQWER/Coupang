package com.ezen.biz.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.lang.model.element.Element;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.biz.dto.BuyVO;
import com.ezen.biz.dto.ImagesVO;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.dto.UsersVO;
import com.ezen.biz.service.BuyService;
import com.ezen.biz.service.ImagesService;
import com.ezen.biz.service.ProductService;

@Controller
public class SellerController {
	@Autowired
	private BuyService buyService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ImagesService imageService;
	
//	@Autowired
//	private ProductService productService;
	
	private final String imgPath="D:/upload/img/";
	
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
	public String sellerInsertProduct(Model model, UsersVO v,
			HttpServletRequest request, HttpSession session,BuyVO vo) {
		v=(UsersVO) session.getAttribute("vo");
		vo.setU_id(v.getU_id());
		
		return "seller/sellerInsertProduct";
		
	}
	@PostMapping("sellerInsertProduct")
	public String sellerInsertProduct(Model model,ProductVO pvo,ImagesVO ivo,
			@RequestParam MultipartFile uploadFile)
			throws IllegalStateException, IOException {

		productService.sellerInsertProduct(pvo);
	
			int pno=productService.sellerGetPno();
			//업로드 파일 처리
			//MultipartFile uploadFile=vo.getUploadFile();
			if(!uploadFile.isEmpty()) {//서버에 저장 작업
				String filename=uploadFile.getOriginalFilename();
				System.out.println("filename="+filename);
				//서버에 저장
				UUID uuid=UUID.randomUUID();
				String saveFilename=uuid+"-"+filename;
				uploadFile.transferTo(new File(imgPath+saveFilename));
				//저장된 파일명을 vo 에 담는다
				 ivo.setMain_img1(saveFilename);
			}
			imageService.insertImages(pvo);
			

		return "seller/sellerHome";
	}
	
//	@PostMapping("sellerInsertImages")
//	public String sellerInsertImages(Model model,ProductVO pvo,ImagesVO vo,@RequestParam MultipartFile uploadFile,ImagesVO ivo) 
//			throws IllegalStateException, IOException {
//		
//		//업로드 파일 처리
//		//MultipartFile uploadFile=vo.getUploadFile();
//		if(!uploadFile.isEmpty()) {//서버에 저장 작업
//			String filename=uploadFile.getOriginalFilename();
//			System.out.println("filename="+filename);
//			//서버에 저장
//			UUID uuid=UUID.randomUUID();
//			String saveFilename=uuid+"-"+filename;
//			uploadFile.transferTo(new File(imgPath+saveFilename));
//			//저장된 파일명을 vo 에 담는다
//			 ivo.setMain_img1(saveFilename);
//		}
//		imageService.insertImages(pvo);
//		return "seller/sellerHome";
//	}
	
	// 판매자 상품등록 내역조회
	@RequestMapping("sellerSellectMineProduct")
	public String sellerSelectProduct(Model model,ProductVO vo) {
		List<ProductVO> list=productService.sellerSellectMineProduct(vo);
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
		UsersVO uvo=new UsersVO();
		vo.setU_id(uvo.getU_id());
		productService.sellerUpdateProduct(vo);
		model.addAttribute("vo",vo);
		return "seller/sellerHome";
	}
}
