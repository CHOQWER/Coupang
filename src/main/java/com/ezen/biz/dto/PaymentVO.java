package com.ezen.biz.dto;

import lombok.Data;

@Data
public class PaymentVO {
	private String card_num,u_id;
	private int cvc;
	private String card_date,card_pwd;
}
