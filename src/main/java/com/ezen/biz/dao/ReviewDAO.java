package com.ezen.biz.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.ReviewVO;
import com.ezen.biz.utils.Criteria;

@Repository
public class ReviewDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	
	// 리뷰 등록
	public void insertReview(ReviewVO vo) {
		mybatis.insert("ReviewDAO.insertReview", vo);
	} 
	
	public int selectRowCount(int pno) {
		return mybatis.selectOne("ReviewDAO.selectRowCount",pno);
	}
	
	public Map<String, Number> selectAvgCountScore(int pno){
		return mybatis.selectOne("ReviewDAO.selectAvgCountScore", pno);
	}
	
	
	public List<ReviewVO> selectReviewScore(int pno,Criteria cri) {
		Map<String, Integer> map=new HashMap<String, Integer>();
		map.put("pno", pno);
		map.put("pageNum", cri.getPageNum());
		map.put("rowsPerPage", cri.getRowsPerPage());
		return mybatis.selectList("ReviewDAO.selectReviewScore", map);
	}
	
	
	public int selectRowCount(ReviewVO vo) {
		return mybatis.selectOne("ReviewDAO.selectRowCount", vo);
	}
	
	// 리뷰삭제
	public void deleteReview(int rno) {
		mybatis.delete("ReviewDAO.deleteReview", rno);
	}
	

}
