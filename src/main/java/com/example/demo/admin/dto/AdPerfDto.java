package com.example.demo.admin.dto;

import lombok.Data;

@Data
public class AdPerfDto {
	private int perfId, resCount, cancelCount, total;
	private String title, perfStart, perfEnd;
}
