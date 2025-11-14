package com.example.demo.performance;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface PerfMapper {
	public void insertPf(PerfDto pdto);
	public int keycheck(String mt20id);
	public List<PerfDto> selectAll();
	public List<PerfDto> selectGenre(String genre);
	public PerfDto pDetail(String perfId);
	public String getTitle(int perfId);
	public List<String> getShowDate(int perfId);
	List<ShowDto> getShowTime(@Param("perfId") int perfId, @Param("showDate") String showDate);
	int getRemainSeat(@Param("perfId") int perfId, @Param("showDate") String showDate,  @Param("showTime") String showTime);
}
