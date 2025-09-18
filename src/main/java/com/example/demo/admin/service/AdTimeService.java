package com.example.demo.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.admin.dto.AdTimeDto;
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

	public String tinsert(HttpServletRequest request)
	{
		int perfId=Integer.parseInt(request.getParameter("perfId"));
		String showDate=request.getParameter("showDate");
		String showTime=request.getParameter("showTime");
		
		AdTimeDto tdto=new AdTimeDto();
		tdto.setPerfId(perfId);
		tdto.setShowDate(showDate);
		tdto.setShowTime(showTime);
		
		mapper.tinsert(tdto);
		
		return "redirect:/admin/time/tmanage?perfId="+perfId;
	}

	public String tdelete(int perfId, int timeId)
	{
		mapper.tdelete(timeId);
		
		return "redirect:/admin/time/tmanage?perfId="+perfId;
	}

}
