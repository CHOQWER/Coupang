package com.ezen.biz.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class UsersVO {
	private String u_id,u_pwd,u_name,u_identity,u_mobile,u_email;
	private int u_post_no;
	private String u_addr1,u_addr2,grade;
	private Date u_regdate;
	private String disp;
}
