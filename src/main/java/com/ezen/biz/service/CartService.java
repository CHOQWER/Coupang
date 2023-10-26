package com.ezen.biz.service;

import java.util.List;

import com.ezen.biz.dto.CartVO;

public interface CartService {

	int insertCart(CartVO vo);

	List<CartVO> selectCartList(CartVO vo);
	
	int selectMaxCno(CartVO vo);
}