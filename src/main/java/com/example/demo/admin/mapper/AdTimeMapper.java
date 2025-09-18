package com.example.demo.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.admin.dto.AdTimeDto;

@Mapper
public interface AdTimeMapper {
	List<AdTimeDto> getTlist(int perfId);
	void tinsert(AdTimeDto tdto);

}
