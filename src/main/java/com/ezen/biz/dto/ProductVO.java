package com.ezen.biz.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductVO {
	private int pno;
	private String n_id,ca_no,sca_no,company,pname;
	private int price,dis_price;
	private String content,color;
	private int qty;
	private Date p_regdate;
	private String disp;
	private String main_img1;
}
