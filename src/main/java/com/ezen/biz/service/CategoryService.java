package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.MainCateVO;
import com.ezen.biz.dto.SubCateVO;

public interface CategoryService {

	List<MainCateVO> selectMCateList();

	List<SubCateVO> selectSCateList();

}