package com.example.demo.admin.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.admin.dto.AdSeatDto;

@Mapper
public interface AdSeatMapper {
	void insertSeat(AdSeatDto sdto);
	void sdelete(int timeId);
}
