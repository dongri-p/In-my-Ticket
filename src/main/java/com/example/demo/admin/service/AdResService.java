package com.example.demo.admin.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.example.demo.admin.dto.AdPerfDto;
import com.example.demo.admin.dto.AdResDto;
import com.example.demo.admin.mapper.AdResMapper;
import com.example.demo.reservation.ResDto;

@Service
public class AdResService {
	
	@Autowired
	private AdResMapper mapper;

	public String perfList(String keyword, int page, Model model)
	{
		int pageSize=10;
		int totalCount=mapper.getPerfCount(keyword);
		int totalPage=(int)Math.ceil((double) totalCount / pageSize);
		
		if(page < 1)
			page=1;
		
		if(page > totalPage)
			page=totalPage;
		
		int start=(page-1)*pageSize;
		
		List<AdPerfDto> plist=mapper.getPerfRes(keyword, start, pageSize);
		
		model.addAttribute("plist", plist);
		model.addAttribute("page", page);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("keyword", keyword);
		
		return "/admin/adReserv/perfList";
	}

	public String rlist(int perfId, Model model)
	{
		List<AdResDto> rlist=mapper.getResList(perfId);
		
		model.addAttribute("rlist", rlist);
		
		return "/admin/adReserv/rlist";
	}

	@Transactional
	public String adCancel(int resId)
	{
		ResDto rdto=mapper.findRes(resId);
		
		if(rdto != null && !"cancelled".equalsIgnoreCase(rdto.getStatus()))
		{
			mapper.cancelRes(resId);
			
			List<Integer> seatIdList=Arrays.stream(rdto.getSeatIds().split(","))
					.map(String::trim).filter(s -> !s.isEmpty())
					.map(Integer::parseInt).toList();
			
			mapper.chgSeatStatus(rdto.getPerfId(), rdto.getTimeId());
		}
		
		return "redirect:/admin/adReserv/rlist?perfId="+rdto.getPerfId();
	}

}
