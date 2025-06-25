package com.example.demo.performance;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PerfMapper {
	public void insertPf(PerfDto pdto);
	public List<PerfDto> selectAll();

}
