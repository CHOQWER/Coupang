package com.ezen.biz.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductVO {
	private int pno;
	private String u_id;
	private int ca_no,sca_no;
	private String company,pname;
	private int price,dis_price;
	private String content,color;
	private int qty;
	private Date p_regdate;
	private String disp;
	private String main_img1;
}
