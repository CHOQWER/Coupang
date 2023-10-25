package com.ezen.biz.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.ezen.biz.dto.BuyVO;
import com.ezen.biz.dto.ImagesVO;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.dto.UsersVO;
import com.ezen.biz.service.BuyService;
import com.ezen.biz.service.ImagesService;
import com.ezen.biz.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
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
	public String sellerInsertProduct(Model model,ProductVO pvo,ImagesVO ivo, String company,
			MultipartFile[] uploadFile)
			throws IllegalStateException, IOException {
//			pvo.setCompany("종현이용");
			log.info("company"+company);
//			log.info(ivo);
			productService.sellerInsertProduct(pvo);
//			System.out.println("pvo.getCompany()2="+pvo.getCompany());
			
			ivo.setPno(productService.sellerGetPno());
			UUID uuid=UUID.randomUUID();				
			
			int i=1;
			for (MultipartFile multipartFile : uploadFile) {
			
				log.info("-------------------------------------");
				log.info("Upload File Name: " + multipartFile.getOriginalFilename());
				log.info("Upload File Size: " + multipartFile.getSize());
				if(multipartFile.getSize()>0) {
					log.info("i="+i);
					String savefilename=uuid+"-"+multipartFile.getOriginalFilename();
					File saveFile = new File(imgPath,savefilename);
					try {
						multipartFile.transferTo(saveFile);
					} catch (Exception e) {
						log.error(e.getMessage());
					} // end catch	
					switch (i) {
					case 1:
						ivo.setMain_img1(savefilename); 
						break;
					case 2:
						ivo.setMain_img2(savefilename); 
						break;
					case 3:
						ivo.setMain_img3(savefilename); 
						break;
					case 4:
						ivo.setMain_img4(savefilename); 
						break;
					case 5:
						ivo.setMain_img1(savefilename); 
						break;
					case 6:
						ivo.setCon_img_1(savefilename); 
						break;
					case 7:
						ivo.setCon_img_1(savefilename); 
						break;
					}
				}
				i++;
			} // end for	
			imageService.insertImages(ivo);
		return "seller/sellerHome";
	}
	
	
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
	
	//테스트 -----------------------------------------------
	
	@GetMapping("/multiFileContent")
	public String multiFileContentPost() {
		return "seller/multiFileContent";
	}
	
	@PostMapping("/multiFileContent")
	public void multiFileContentPost(MultipartFile[] uploadFile,String title ,Model model) {
		log.info(title);
		int i=1;
		for (MultipartFile multipartFile : uploadFile) {

			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
			if(multipartFile.getSize()>0) {

				File saveFile = new File(imgPath, multipartFile.getOriginalFilename());
				try {
					multipartFile.transferTo(saveFile);
				} catch (Exception e) {
					log.error(e.getMessage());
				} // end catch
				log.info("i="+i);
				//switch문...
			}
			i++;
		} // end for

	}
}
