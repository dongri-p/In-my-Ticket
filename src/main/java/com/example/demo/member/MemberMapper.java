package com.example.demo.member;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.reservation.ResDto;

@Mapper
public interface MemberMapper {
	public Integer useridCheck(String userid);
	public void memberOk(MemberDto mdto);
	public List<ResViewDto> getReservations(int memberId);
	public ResDto findRes(int resId);
	public int cancelRes(int resId);
	public void chgSeatStatus(int perfId, String time, List<Integer> seatIdList);

}
