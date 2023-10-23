package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.NoticeDAO;
import com.ezen.biz.dto.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO dao;
	
	@Override
	public void insertNotice(NoticeVO vo) {
		dao.insertNotice(vo);
	}

	@Override
	public void updateNotice(NoticeVO vo) {
		dao.updateNotice(vo);
	}

	@Override
	public void deleteNotice(NoticeVO vo) {
		dao.deleteNotice(vo);
	}

	@Override
	public List<NoticeVO> selectNoticeList(NoticeVO vo) {
		return dao.selectNoticeList(vo);
	}

	@Override
	public NoticeVO getNoticeList(NoticeVO vo) {
		return dao.getNoticeList(vo);
	}

}
