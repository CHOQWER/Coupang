package com.ezen.biz.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class NoticeVO {
	private int nno;
	private String n_title,n_content,type;
	private Date n_regdate;
	private String disp;
	//검색관련
	private String searchCondition;
	private String searchKeyword;
}
