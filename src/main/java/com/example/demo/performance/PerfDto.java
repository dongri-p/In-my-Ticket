package com.example.demo.performance;

import lombok.Data;

@Data
public class PerfDto {
	private int perfId;
	private String title,location,sDate,eDate,imageUrl;
	
	@Override
    public String toString()
	{
        return "PerformanceDto{" +
                "title='" + title + '\'' +
                ", location='" + location + '\'' +
                ", sDate='" + sDate + '\'' +
                ", eDate='" + eDate + '\'' +
                ", imageUrl='" + imageUrl + '\'' +
                '}';
    }
}
