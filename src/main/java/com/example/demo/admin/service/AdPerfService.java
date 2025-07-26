package com.example.demo.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.performance.PerfDto;
import com.example.demo.performance.PerfMapper;

@Service
public class AdPerfService {

	@Autowired
	private PerfMapper mapper;
	
	public String adPerfList(Model model)
	{
		List<PerfDto> plist=mapper.selectAll();
		
		model.addAttribute("plist", plist);
		
		return "/admin/adPerformance/adPerfList";
	}
	
	
}
