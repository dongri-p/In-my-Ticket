package com.example.demo.performance;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PerfMapper {
	public void insertPf(PerfDto pdto);
	public int keycheck(PerfDto pdto);
	public List<PerfDto> selectAll();
	public List<PerfDto> selectGenre(String genre);
	public PerfDto pDetail(String perfId);
	public String getTitle(int perfId);
	public List<ShowDto> getShowList(int perfId);
}
