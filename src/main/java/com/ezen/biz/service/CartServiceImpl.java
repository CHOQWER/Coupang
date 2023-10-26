package com.ezen.biz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ezen.biz.dao.CartDAO;
import com.ezen.biz.dto.CartVO;

@Service
public class CartServiceImpl implements CartService {
	@Autowired
	private CartDAO dao;


	 
	    public int insertCart(CartVO vo) {
	        // 장바구니에 상품 추가
	        dao.insertCart(vo);
	        // 데이터베이스에서 가장 큰 cno 값을 가져오기
	        int maxCno = dao.selectMaxCno(vo);
	        return maxCno;
	    }
	public List<CartVO> selectCartList(CartVO vo) {
		
		return dao.selectCartList(vo);
	}
	
	public int selectMaxCno(CartVO vo) {
		
		return dao.selectMaxCno(vo);
	}
	
}
