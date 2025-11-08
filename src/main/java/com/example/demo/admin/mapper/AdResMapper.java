package com.example.demo.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.admin.dto.AdPerfDto;
import com.example.demo.admin.dto.AdResDto;

@Mapper
public interface AdResMapper {
	List<AdPerfDto> getPerfRes(@Param("keyword") String keyword);
	List<AdResDto> getResList(int perfId);

}
