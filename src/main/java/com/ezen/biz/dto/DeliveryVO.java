package com.ezen.biz.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class DeliveryVO {
	private int dno;
	private String u_id,u_name,u_mobile;
	private int post_no;
	private String addr1,addr2;
	private Date b_regdate,d_regdate;
}
