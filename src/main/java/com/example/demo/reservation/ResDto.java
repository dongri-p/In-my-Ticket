package com.example.demo.reservation;

import lombok.Data;

@Data
public class ResDto {
	private int resId,memberId,perfId,timeId,people,price,totalPrice;
	private String seatIds,payMethod,date,time;
}
