package com.ezen.biz.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class CommunityVO {
	private int cno;
	private String c_title,u_id,c_content,c_photo;
	private Date c_regdate;
	private int c_cnt;
}
