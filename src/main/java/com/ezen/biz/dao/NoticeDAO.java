package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.NoticeVO;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 공지사항 등록
	public void insertNotice(NoticeVO vo) {
		mybatis.insert("NoticeDAO.insertNotice", vo);
	}
	
	// 공지사항 수정
	public void updateNotice(NoticeVO vo) {
		mybatis.update("NoticeDAO.updateNotice", vo);
	}
	
	// 공지사항 삭제
	public void deleteNotice(int nno) {
		mybatis.update("NoticeDAO.deleteNotice", nno);
	}
	
	// 리스트 뽑기
	public List<NoticeVO> selectNoticeList(NoticeVO vo) {
		return mybatis.selectList("NoticeDAO.selectNoticeList", vo);
	}
	
}
