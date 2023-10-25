package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.BuyDAO;
import com.ezen.biz.dao.ImagesDAO;
import com.ezen.biz.dto.BuyVO;
import com.ezen.biz.dto.ImagesVO;
import com.ezen.biz.dto.ProductVO;
@Service
public class ImagesServiceImpl implements ImagesService {
	@Autowired
	private ImagesDAO dao;

	@Override
	public void insertImages(ImagesVO ivo) {
		dao.insertImages(ivo);
	}

}
