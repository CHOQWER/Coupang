package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.NoticeVO;

public interface NoticeService {

	// 공지사항 등록
	void insertNotice(NoticeVO vo);

	// 공지사항 수정
	void updateNotice(NoticeVO vo);

	// 공지사항 삭제
	void deleteNotice(NoticeVO vo);

	// 리스트 뽑기
	List<NoticeVO> selectNoticeList(NoticeVO vo);

	// 공지사항 검색
	NoticeVO getNoticeList(NoticeVO vo);

}