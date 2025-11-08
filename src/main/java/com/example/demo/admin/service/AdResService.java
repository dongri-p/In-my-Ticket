package com.example.demo.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.admin.dto.AdPerfDto;
import com.example.demo.admin.dto.AdResDto;
import com.example.demo.admin.mapper.AdResMapper;

@Service
public class AdResService {
	
	@Autowired
	private AdResMapper mapper;

	public String perfList(String keyword, Model model)
	{
		List<AdPerfDto> plist=mapper.getPerfRes(keyword);
		
		model.addAttribute("plist", plist);
		
		return "/admin/adReserv/perfList";
	}

	public String rlist(int perfId, Model model)
	{
		List<AdResDto> rlist=mapper.getResList(perfId);
		
		model.addAttribute("rlist", rlist);
		
		return "/admin/adReserv/rlist";
	}

}
