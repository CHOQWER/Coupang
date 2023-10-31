package com.ezen.biz.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.ReviewDAO;
import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.utils.Criteria;

@Service
public class ReviewServiceImpl implements ReviewService {
	
	@Autowired
	private ReviewDAO dao;

	@Override
	public void insertReview(ReviewVO vo) {
		dao.insertReview(vo);
}

	@Override
	public int selectRowCount(int pno) {
		return dao.selectRowCount(pno);
	}

	@Override
	public Map<String, Number> selectAvgCountScore(int pno) {
		return dao.selectAvgCountScore(pno);
	}

	@Override
	public List<ReviewVO> selectReviewScore(int pno, Criteria cri) {
		return dao.selectReviewScore(pno, cri);
	}

	@Override
	public int selectRowCount(ReviewVO vo) {
		return dao.selectRowCount(vo);
	}

	@Override
	public void deleteReview(int rno) {
		dao.deleteReview(rno);
	}

}
