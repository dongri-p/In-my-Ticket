package com.example.demo.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.admin.dto.AdSeatDto;
import com.example.demo.admin.dto.AdTimeDto;
import com.example.demo.admin.mapper.AdSeatMapper;
import com.example.demo.admin.mapper.AdTimeMapper;
import com.example.demo.performance.PerfDto;
import com.example.demo.performance.PerfMapper;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class AdTimeService {
	
	@Autowired
	private AdTimeMapper mapper;
	
	@Autowired
	private PerfMapper perfMapper;
	
	@Autowired
	private AdSeatMapper seatMapper;

	public String tmanage(int perfId, Model model)
	{
		List<AdTimeDto> tlist=mapper.getTlist(perfId);
		String title=perfMapper.getTitle(perfId);
		
		model.addAttribute("tlist", tlist);
		model.addAttribute("perfId", perfId);
		model.addAttribute("title", title);
		
		return "/admin/time/tmanage";
	}

	public String tlist(Model model)
	{
		List<PerfDto> plist=perfMapper.selectAll();
		
		model.addAttribute("plist", plist);
		
		return "/admin/time/tlist";
	}

	public String tinsert(HttpServletRequest request, AdTimeDto tdto)
	{
		int perfId=Integer.parseInt(request.getParameter("perfId"));
		String showDate=request.getParameter("showDate");
		String showTime=request.getParameter("showTime");
		
		tdto.setPerfId(perfId);
		tdto.setShowDate(showDate);
		tdto.setShowTime(showTime);
		
		mapper.tinsert(tdto);
		
		int timeId=mapper.getTimeId(perfId);
		
		List<AdSeatDto> seatList=new ArrayList<>();
		
		for(char row = 'A'; row <= 'D'; row++)
		{
			for(int col = 1; col <= 5; col++)
			{
				AdSeatDto sdto=new AdSeatDto();
				sdto.setPerfId(perfId);
				sdto.setTimeId(timeId);
				sdto.setSeatRow(String.valueOf(row));
				sdto.setSeatCol(col);
				sdto.setReserved(0);
				
				seatList.add(sdto);
			}
		}
		
		for(AdSeatDto sdto : seatList)
		{
			seatMapper.insertSeat(sdto);
		}
		
		return "redirect:/admin/time/tmanage?perfId="+perfId;
	}

	public String tdelete(int perfId, int timeId)
	{
		mapper.tdelete(timeId);
		
		return "redirect:/admin/time/tmanage?perfId="+perfId;
	}

}
