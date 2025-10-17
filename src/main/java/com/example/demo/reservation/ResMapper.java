package com.example.demo.reservation;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.admin.dto.AdSeatDto;

@Mapper
public interface ResMapper {
	List<AdSeatDto> getSeatList(Map<String, Object> paramMap);
	int getTimeId(Map<String, Object> paramMap);
	void reservate(ResDto rdto);
	void updateSeat(Map<String, Object> seatMap);
}
