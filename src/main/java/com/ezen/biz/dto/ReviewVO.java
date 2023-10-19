package com.ezen.biz.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int rno,pno;
	private String r_title,u_id,r_content,r_photo;
	private Date r_regdate;
	private int r_cnt;
}
