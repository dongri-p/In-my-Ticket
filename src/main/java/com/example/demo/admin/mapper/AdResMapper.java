package com.example.demo.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.admin.dto.AdPerfDto;
import com.example.demo.admin.dto.AdResDto;
import com.example.demo.reservation.ResDto;

@Mapper
public interface AdResMapper {
	int getPerfCount(@Param("keyword") String keyword);
	List<AdPerfDto> getPerfRes(@Param("keyword") String keyword, int start, int pageSize);
	List<AdResDto> getResList(int perfId);
	ResDto findRes(int resId);
	int cancelRes(int resId);
	void chgSeatStatus(List<Integer> seatIdList);
}
