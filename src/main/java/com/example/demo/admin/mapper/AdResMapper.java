package com.example.demo.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.admin.dto.AdPerfDto;
import com.example.demo.admin.dto.AdResDto;

@Mapper
public interface AdResMapper {
	int getPerfCount(@Param("keyword") String keyword);
	List<AdPerfDto> getPerfRes(@Param("keyword") String keyword, int startRow, int pageSize);
	List<AdResDto> getResList(int perfId);

}
