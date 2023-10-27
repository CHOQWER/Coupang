package com.ezen.biz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.service.ReviewService;
import com.ezen.biz.utils.Criteria;
import com.ezen.biz.utils.PageMaker;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class ReviewController {
	
	@Autowired
	private ReviewService service;
	
	@RequestMapping("saveStar")
	public void saveStar(ReviewVO vo, HttpServletResponse response) throws IOException {
		// 별점 삽입
		service.insertReview(vo);
		Map<String, Number> map = service.selectAvgCountScore(vo.getPno());
		JsonObject ob = new JsonObject();
		ob.addProperty("avgScore", map.get("AVG"));
		ob.addProperty("cnt", map.get("CNT"));
		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(ob);
		out.flush();
		out.close();
	}
	
	@PostMapping("getStar")
	public void getStar(ReviewVO vo, @RequestParam int page, HttpServletResponse response) throws IOException {
		// 페이징관련 작업
		Criteria cri = new Criteria();
		cri.setPageNum(page);
		cri.setRowsPerPage(5);// 5개씩 추출
		int tot = service.selectRowCount(vo);
		PageMaker pMaker = new PageMaker(cri, tot);
		// 다음페이지??
		boolean next = pMaker.nextPageScore();
		List<ReviewVO> list = service.selectReviewScore(vo.getPno(), cri);
		// json데이터 조립 :gson 라이브러리 사용
		if (list != null) {
			JsonObject jObj = new JsonObject();
			jObj.addProperty("next", next);// 더보기버튼 활성화
			// list를 json array로 만들기
			JsonArray arr = new JsonArray();
			// json 객체 만들기
			JsonObject data = null;
			SimpleDateFormat dateFormat = new SimpleDateFormat("yy-MM-dd");
			for (ReviewVO v : list) {
				data = new JsonObject();
				data.addProperty("rno", v.getRno());
				data.addProperty("u_id", v.getU_id());
				data.addProperty("score", v.getScore());				
				data.addProperty("r_title", v.getR_title());
				data.addProperty("r_content", v.getR_content());
				String r_regdate = dateFormat.format(v.getR_regdate());
			    data.addProperty("r_regdate", r_regdate);
				arr.add(data);
			}
			jObj.add("arr", arr);
			response.setContentType("application/json;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(jObj);
			out.flush();
			out.close();
		}
	}
	
	@PostMapping("deleteReview")
    public void deleteReview(@RequestParam int rno) {
		log.info("rno="+rno);
		service.deleteReview(rno);	
    }

}

