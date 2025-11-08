package com.example.demo.admin.dto;

import lombok.Data;

@Data
public class AdResDto {
	private int resId, people, totalPrice;
	private String userid, title, showDate, showTime, status;
}
