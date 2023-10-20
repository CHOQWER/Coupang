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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import com.ezen.biz.dto.MainCateVO;
import com.ezen.biz.dto.ProductVO;
import com.ezen.biz.dto.SubCateVO;

import com.ezen.biz.service.ProductService;
import com.ezen.biz.utils.Criteria;
import com.ezen.biz.utils.PageMaker;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ProductController {

	@Autowired
	private ProductService service;

	private final String imgPath = "D:/upload/coupang/";
	
	@RequestMapping("/")
	public String showCategory(Model model) {
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
		model.addAttribute("catelist", catelist);

		return "main";
	}
	
	
	@GetMapping("ProductView")
	public String ProductView(ProductVO vo, Model model) {
		List<ProductVO> list=service.selectProductListPno(1);
		System.out.println(list);
		model.addAttribute("list",list);
		return "ProductView";
	}
	

	@RequestMapping("ProductList")
	public String ProductList(ProductVO vo, @RequestParam int sca_no, @RequestParam(required = false, defaultValue = "1") int pageNum, Model model) {
	    // 페이징 관련 작업
		Criteria cri = new Criteria();
	    cri.setPageNum(pageNum);
	    cri.setRowsPerPage(6); // 6개씩 추출
	    
	    // 특정 서브별(sca_no 값) 전체 개수 세기
	    int tot = service.selectRowCount(sca_no);
	    PageMaker pMaker = new PageMaker(cri, tot);
	    boolean next = pMaker.nextPageScore();
	    
	    List<ProductVO> list = service.selectProductList(sca_no, cri);
	    model.addAttribute("list", list);
	    
	    int cnt = service.selectRowCount(sca_no);
	    PageMaker maker = new PageMaker(cri, cnt);
	    model.addAttribute("pmaker", maker);
	    return "ProductList";
	}



	

	@GetMapping("imgDown")
	public void imgDown(@RequestParam String main_img1, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		// 파라메타값 받아오기
		// 저장되어 있는 파일명 : filename -앞37자리 uuid
		String pathFilename = imgPath + main_img1;// 경로 포함 파일명
		
		// 이미지를 다른이름으로 다운로드할 때 uuid제외한 파일명 수정

		// 웹브라우저의 종류 확인
		String agent = request.getHeader("User-Agent");
		
		// ie 7 또는 edge
		boolean ieBrowser = (agent.indexOf("Trident") > -1) || (agent.indexOf("Edge") > -1);
		if (ieBrowser) {
			main_img1 = URLEncoder.encode(main_img1, "utf-8").replace("\\", "%20");
		} else {// edge, 파이어폭스, 크롬
			main_img1 = new String(main_img1.getBytes("utf-8"), "iso-8859-1");
		}
		response.setContentType("image/jpg");
		// 다운로드 되는 파일명 설정
		response.setHeader("Content-Disposition", "attachment;filename=" + main_img1);
		FileInputStream in = new FileInputStream(pathFilename);// 파일 open
		// 출력할 곳
		BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());
		int numRead;
		byte b[] = new byte[4096];// 4K만큼
		while ((numRead = in.read(b, 0, b.length)) != -1) {
			out.write(b, 0, numRead);
		} // end while
		out.flush();// 버퍼에 남은것 출력
		in.close();
		out.close();
	}

}
