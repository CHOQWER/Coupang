package com.ezen.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezen.biz.dto.DeliveryVO;

@Repository
public class DeliveryDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;


	public List<DeliveryVO> selectDeli(String u_id) {
		return mybatis.selectList("DeliveryDao.selectDeli", u_id);
	}
	
	public int insertDeli(DeliveryVO vo) {
		return mybatis.insert("DeliveryDao.insertDeli",vo);
	}
	
	public int deleteDeli(int dno) {
		return mybatis.delete("DeliveryDao.deleteDeli",dno);
	}
}
