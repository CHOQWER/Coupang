package com.ezen.biz.controller;

import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.biz.dto.ImagesVO;
import com.ezen.biz.dto.MainCateVO;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.dto.SubCateVO;
import com.ezen.biz.service.BuyService;
import com.ezen.biz.service.ProductService;
import com.ezen.biz.service.ReviewService;
import com.ezen.biz.utils.Criteria;
import com.ezen.biz.utils.PageMaker;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ProductController {

   @Autowired
   private ProductService service;
   
   @Autowired
   private ReviewService rservice;
   
   @Autowired
   private BuyService bservice;


	private final String imgPath = "D:/upload/coupang/";
	
	@RequestMapping("ProductList")
	public String ProductList(Criteria cri, ProductVO vo, @RequestParam String cate_name, @RequestParam(required = false) String subcate_name, 
		    Model model, @RequestParam(required = false, defaultValue = "1") Integer listtype) {
		
		if(cri.getSearchword()=="") {
			cri.setSearchword(null);
		}
		if(cri.getCompany()=="") {
			cri.setCompany(null);
		}
	
		int tot = service.selectRowCountPaging(cri);
		PageMaker pMaker = new PageMaker(cri, tot);
		boolean next = pMaker.nextPageScore();

		int cnt = service.selectRowCountPaging(cri);
		PageMaker maker = new PageMaker(cri, cnt);
		model.addAttribute("pmaker", maker);
		

		List<ProductVO> list = service.productListPaging(cri);
		model.addAttribute("list", list);

		List<ProductVO> clist =null;
		model.addAttribute("listtype", listtype);
		if(listtype==1) {
			clist = service.companyListCa(cri.getCa_no());
			model.addAttribute("clist", clist);			
		} else if(listtype==2) {
			clist =service.companyListSca(cri.getSca_no());
			model.addAttribute("clist", clist);
		}
		
		// 평점정보
		Map<String, Number> map = null;
		List<Map<String, Number>> starlist = new ArrayList<Map<String, Number>>();
		for (ProductVO product : list) {
			int pno = product.getPno();
			map = rservice.selectAvgCountScore(pno);
			starlist.add(map);
		}
		model.addAttribute("starlist", starlist);
		model.addAttribute("cate_name", cate_name);
		model.addAttribute("subcate_name", subcate_name);
		return "product/ProductList";
	}

	@RequestMapping("/")
	public String showCategory(ProductVO vo, Model model, HttpServletRequest request) {
		// 뷰로 보낼 전체 내용이 삽입된
		List<Map<String, Object>> catelist = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> subcatelist = null;
		// DB 에서 CATE 목록 가져오기
		List<MainCateVO> cates = service.getCategory();
		List<SubCateVO> subcates = null;
		for (MainCateVO cvo : cates) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("no", cvo.getCa_no());
			map.put("name", cvo.getCate_name());
			subcates = service.getSubCategory(cvo.getCa_no());
			subcatelist = new ArrayList<Map<String, Object>>();
			Map<String, Object> submap = null;
			for (SubCateVO svo : subcates) {
				submap = new HashMap<String, Object>();
				submap.put("sno", svo.getSca_no());
				submap.put("sname", svo.getSubcate_name());
				subcatelist.add(submap);
			}
			map.put("subcates", subcatelist);
			catelist.add(map);

		}
		HttpSession cateSession = request.getSession();
		cateSession.setAttribute("catelist", catelist);

		// 랜덤상품
		List<ProductVO> plist = service.randomProduct();
		model.addAttribute("plist", plist);
		return "main";
	}
	
	@GetMapping("ProductView1")
	public String ProductView(ProductVO pvo, ImagesVO ivo, Model model, @RequestParam int pno) {
		pvo = service.selectProductPno(pno);
		ivo = service.selectImgPno(pno);
		Map<String, Number> map = rservice.selectAvgCountScore(pno);
		model.addAttribute("pvo", pvo);
		model.addAttribute("ivo", ivo);
		model.addAttribute("map", map);
		pvo.getCa_no();
		System.out.println(" pvo.getCa_no()=" + pvo.getCa_no());

//      model.addAttribute("cate_name",cate_name);
//      model.addAttribute("subcate_name",subcate_name);
		return "product/ProductView";
	}

	@GetMapping("ProductView")
	public String ProductView(ProductVO pvo, ImagesVO ivo, Model model, @RequestParam int pno,
			@RequestParam(value = "cate_name", required = false) String cate_name,
			@RequestParam(value = "subcate_name", required = false) String subcate_name) {
		pvo = service.selectProductPno(pno);
		ivo = service.selectImgPno(pno);
		Map<String, Number> map = rservice.selectAvgCountScore(pno);
		model.addAttribute("pvo", pvo);
		model.addAttribute("ivo", ivo);
		model.addAttribute("map", map);
		model.addAttribute("cate_name", cate_name);
		model.addAttribute("subcate_name", subcate_name);
		return "product/ProductView";
	}



	@GetMapping("imgDown")
	public void imgDown(@RequestParam String imgName, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// 파일명에 이미지 확장자 추가
		if (!imgName.matches(".+\\.(jpg|png|jpeg)$")) {
			imgName += ".jpg"; // 기본 확장자를 ".jpg"로 설정
		}

		String pathFilename = imgPath + imgName;

		String agent = request.getHeader("User-Agent");
		boolean ieBrowser = (agent.indexOf("Trident") > -1) || (agent.indexOf("Edge") > -1);

		if (ieBrowser) {
			imgName = URLEncoder.encode(imgName, "utf-8").replace("\\", "%20");
		} else {
			imgName = new String(imgName.getBytes("utf-8"), "iso-8859-1");
		}

		response.setContentType("image/jpeg"); // 이미지의 확장자에 따라 다르게 설정할 수도 있음
		response.setHeader("Content-Disposition", "attachment;filename=" + imgName);

		FileInputStream in = new FileInputStream(pathFilename);
		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		int numRead;
		byte b[] = new byte[4096];

		while ((numRead = in.read(b, 0, b.length)) != -1) {
			out.write(b, 0, numRead);
		}

		out.flush();
		in.close();
		out.close();
	}



}