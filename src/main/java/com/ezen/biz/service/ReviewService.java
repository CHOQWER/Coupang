package com.ezen.biz.service;


import java.util.List;
import java.util.Map;

import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.utils.Criteria;

public interface ReviewService {

	// 리뷰 등록
	void insertReview(ReviewVO vo);
	
	int selectRowCount(int pno);
	
	int selectRowCount(ReviewVO vo);
	
	Map<String, Number> selectAvgCountScore(int pno);
	
	List<ReviewVO> selectReviewScore(int pno,Criteria cri);
	
}