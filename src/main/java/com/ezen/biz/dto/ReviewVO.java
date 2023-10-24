package com.ezen.biz.dto;

import java.sql.Date;

import lombok.Data;	

@Data
public class ReviewVO {
	private int rno, pno;
	private String u_id;
	private double score;
	private String r_title, r_content;
	private Date r_regdate;	
}