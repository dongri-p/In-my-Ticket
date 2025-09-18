package com.example.demo.admin.dto;

import lombok.Data;

@Data
public class AdSeatDto {
	private String seatId, perfId, timeId, seatCol;
	private char seatRow;
	private boolean reserved;
}
