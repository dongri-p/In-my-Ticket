package com.example.demo.reservation;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.admin.dto.AdSeatDto;
import com.example.demo.member.MemberDto;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import jakarta.servlet.http.HttpSession;

@Service
public class ResService {

	@Autowired
	private ResMapper mapper;

	public String selectSeat(int perfId, String title, String date, String time, Model model)
	{
		Map<String, Object> paramMap=new HashMap<>();
		paramMap.put("perfId", perfId);
		paramMap.put("showDate", date);
		paramMap.put("showTime", time);
	
		List<AdSeatDto> seatList=mapper.getSeatList(paramMap);
		
		model.addAttribute("seatList", seatList);
		model.addAttribute("perfId", perfId);
		model.addAttribute("date", date);
		model.addAttribute("time", time);
		
		return "/reservation/selectSeat";
	}
	
	public String payment(int perfId, String title, String date, String time,
			List<String> seatIds, HttpSession session, Model model)
	{
		String userid=session.getAttribute("userid").toString();
		
		MemberDto mdto=mapper.getMember(userid);
		model.addAttribute("mdto", mdto);
		
		model.addAttribute("perfId", perfId);
		model.addAttribute("date", date);
		model.addAttribute("time", time);
		model.addAttribute("seatIds", seatIds);
		
		return "/reservation/payment";
	}

	public String comPay(ResDto rdto, HttpSession session)
	{
		String userid=session.getAttribute("userid").toString();
		if(userid == null)
		{
			return "redirect:/login/login";
		}
		
		Integer memberId=mapper.getMemberId(userid);
		rdto.setMemberId(memberId);
		
		Map<String, Object> paramMap=new HashMap<>();
		paramMap.put("perfId", rdto.getPerfId());
		paramMap.put("date", rdto.getDate());
		paramMap.put("time", rdto.getTime());
		
		int timeId=mapper.getTimeId(paramMap);
		rdto.setTimeId(timeId);
		
		mapper.reserve(rdto);
		
		String[] seatNameArray=rdto.getSeatIds().split(",");
		
		Map<String, Object> seatMap=new HashMap<>();
		seatMap.put("perfId", rdto.getPerfId());
		seatMap.put("timeId", timeId);
		seatMap.put("seatNames", Arrays.asList(seatNameArray));
		
		mapper.updateSeat(seatMap);
		
		session.setAttribute("resId", rdto.getResId());
		session.setAttribute("title", rdto.getTitle());
		session.setAttribute("date", rdto.getDate());
		session.setAttribute("time", rdto.getTime());
		session.setAttribute("seatIds", rdto.getSeatIds());
		session.setAttribute("people", rdto.getPeople());
		session.setAttribute("totalPrice", rdto.getTotalPrice());
		session.setAttribute("payMethod", rdto.getPayMethod());
		
		return "redirect:/reservation/complete";
	}

	public String complete(HttpSession session, Model model)
	{
		model.addAttribute("resId", session.getAttribute("resId"));
		model.addAttribute("title", session.getAttribute("title"));
		model.addAttribute("date", session.getAttribute("date"));
		model.addAttribute("time", session.getAttribute("time"));
		model.addAttribute("seatIds", session.getAttribute("seatIds"));
		model.addAttribute("people", session.getAttribute("people"));
		model.addAttribute("totalPrice", session.getAttribute("totalPrice"));
		model.addAttribute("payMethod", session.getAttribute("payMethod"));
		
		return "/reservation/complete";
	}
}












