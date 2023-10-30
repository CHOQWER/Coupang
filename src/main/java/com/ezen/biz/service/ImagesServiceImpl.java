package com.ezen.biz.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.ImagesDAO;
import com.ezen.biz.dto.ImagesVO;
@Service
public class ImagesServiceImpl implements ImagesService {
	@Autowired
	private ImagesDAO dao;

	@Override
	public void insertImages(ImagesVO ivo) {
		dao.insertImages(ivo);
	}

	@Override
	public void sellerDeleteImages(int pno) {
		dao.sellerDeleteImages(pno);
		
	}

}
