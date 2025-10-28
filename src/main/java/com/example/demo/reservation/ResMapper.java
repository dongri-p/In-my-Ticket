package com.example.demo.reservation;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.admin.dto.AdSeatDto;
import com.example.demo.member.MemberDto;

@Mapper
public interface ResMapper {
	List<AdSeatDto> getSeatList(Map<String, Object> paramMap);
	int getTimeId(Map<String, Object> paramMap);
	void reserve(ResDto rdto);
	void updateSeat(Map<String, Object> seatMap);
	MemberDto getMember(String userid);
	int getMemberId(String userid);
	List<String> getSeatNames(List<String> seatIds);
}
