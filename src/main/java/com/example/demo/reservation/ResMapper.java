package com.example.demo.reservation;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.demo.admin.dto.AdSeatDto;

@Mapper
public interface ResMapper {
	List<AdSeatDto> getSeatList(@Param("perfId") int perfId,
								@Param("showdate") String showdate,
								@Param("showTime") String showtime);

}
