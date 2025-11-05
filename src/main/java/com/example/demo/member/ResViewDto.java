package com.example.demo.member;

import lombok.Data;

@Data
public class ResViewDto {
	private int resId, people, totalPrice;
	private String title, date, time, seatIds, status;
}
