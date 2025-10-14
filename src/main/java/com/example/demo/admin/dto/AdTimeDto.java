package com.example.demo.admin.dto;

import lombok.Data;

@Data
public class AdTimeDto {
	private int timeId;
	private int perfId;
	private int price;
	private String showDate;
	private String showTime;
}
