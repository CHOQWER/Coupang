package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.MainCateVO;
import com.ezen.biz.dto.SubCateVO;


@Repository
public class CategoryDAO{
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<MainCateVO> selectMCateList(){
		return mybatis.selectList("CategoryDAO.selectMCateList");
	}
	public List<SubCateVO> selectSCateList(){
		return mybatis.selectList("CategoryDAO.selectSCateList");
	}
}
