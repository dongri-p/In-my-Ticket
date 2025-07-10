package com.example.demo.performance;

import lombok.Data;

@Data
public class PerfDto {
	private int perfId;
	private String title,location,startDate,endDate,imageUrl;
	private String genre,mt20id,runtime,grade;
	
	@Override
    public String toString()
	{
        return "PerformanceDto{" +
                "title='" + title + '\'' +
                ", location='" + location + '\'' +
                ", sDate='" + startDate + '\'' +
                ", eDate='" + endDate + '\'' +
                ", imageUrl='" + imageUrl + '\'' +
                ", genre='" + genre + '\'' +
                '}';
    }
	
}
