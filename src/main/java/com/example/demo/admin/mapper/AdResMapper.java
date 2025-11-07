package com.example.demo.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.admin.dto.AdPerfDto;

@Mapper
public interface AdResMapper {
	List<AdPerfDto> getPerfRes(String keyword);

}
