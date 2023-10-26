package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.CategoryDAO;
import com.ezen.biz.dto.MainCateVO;
import com.ezen.biz.dto.SubCateVO;
@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	private CategoryDAO dao;
	
	@Override
	public List<MainCateVO> selectMCateList() {
		return dao.selectMCateList();
	}

	@Override
	public List<SubCateVO> selectSCateList() {
		return dao.selectSCateList();
	}

}
