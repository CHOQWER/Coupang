package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ezen.biz.dao.CartDAO;
import com.ezen.biz.dto.CartVO;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO dao;


    public void insertCart(CartVO vo) {
        dao.insertCart(vo); // 데이터베이스에 데이터를 삽입하는 DAO 메서드 호출
    }

	public List<CartVO> selectCartList(CartVO vo) {
		
		return dao.selectCartList(vo);
	}

}
