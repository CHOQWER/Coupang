package com.ezen.biz.dto;



import java.util.Date;

import lombok.Data;

@Data
public class BuyVO {
	private int bno;
	private String u_id;
	private int pno;
	private String pname;
	private int price,dis_price,b_cnt,c_cnt,post_no;
	private String addr1,addr2;
	private Date b_regdate;
	private String sta;
	private String main_img1;

	

	private Date refundsta;//반품 가능 여부 




}
