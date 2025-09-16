package com.example.demo.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.admin.dto.AdTimeDto;
import com.example.demo.admin.mapper.AdTimeMapper;
import com.example.demo.performance.PerfDto;
import com.example.demo.performance.PerfMapper;

@Service
public class AdTimeService {
	
	@Autowired
	private AdTimeMapper mapper;
	
	@Autowired
	private PerfMapper perfMapper;

	public String tmanage(int perfId, Model model)
	{
		List<AdTimeDto> tlist=mapper.getTlist(perfId);
		
		model.addAttribute("tlist", tlist);
		model.addAttribute("perfId", perfId);
		
		return "/admin/time/tmanage";
	}

	public String tlist(Model model)
	{
		List<PerfDto> plist=perfMapper.selectAll();
		
		model.addAttribute("plist", plist);
		
		return "/admin/time/tlist";
	}

}
