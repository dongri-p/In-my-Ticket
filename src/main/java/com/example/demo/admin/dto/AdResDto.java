package com.example.demo.admin.dto;

import lombok.Data;

@Data
public class AdResDto {
	private int resId, memberId, people, totalPrice;
	private String userid, title, date, time, status;
}
