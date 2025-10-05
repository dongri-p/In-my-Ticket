package com.example.demo.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.admin.dto.AdSeatDto;

import jakarta.servlet.http.HttpSession;

@Service
public class ResService {

	@Autowired
	private ResMapper mapper;

	public String selectSeat(int perfId, String date, String time, Model model)
	{
		List<AdSeatDto> seatList=mapper.getSeatList(perfId, date, time);
		
		model.addAttribute("seatList", seatList);
		
		return "/reservation/selectSeat";
	}
}
