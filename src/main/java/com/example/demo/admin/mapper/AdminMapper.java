package com.example.demo.admin.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.admin.dto.AdminDto;

@Mapper
public interface AdminMapper {
	public String adLoginOk(AdminDto adto);

}
