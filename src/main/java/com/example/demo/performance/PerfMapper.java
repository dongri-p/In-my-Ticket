package com.example.demo.performance;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PerfMapper {
	public void insertPf(PerfDto pdto);

}
