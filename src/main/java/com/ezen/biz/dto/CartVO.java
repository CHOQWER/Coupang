package com.ezen.biz.dto;

import lombok.Data;

@Data
public class CartVO {
	private int cno,ino;
	private String u_id;
	private int pno;
	private String main_img1,pname;
	private int price,dis_price,c_cnt;
}
