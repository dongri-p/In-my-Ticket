package com.example.demo.admin.dto;

import lombok.Data;

@Data
public class AdSeatDto {
	private int seatId, perfId, timeId, seatCol, reserved;
	private String seatRow;
}
