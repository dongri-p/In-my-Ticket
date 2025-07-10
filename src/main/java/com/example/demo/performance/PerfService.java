package com.example.demo.performance;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

@Service
public class PerfService {
	
	@Autowired
	private PerfMapper mapper;
	
	public String list(String genre, Model model)
	{
		List<PerfDto> plist=mapper.selectGenre(genre);
		
		model.addAttribute("plist", plist);
		model.addAttribute("genre", genre);
		
		return "/performance/list";
	}

	public String pDetail(HttpServletRequest request, Model model)
	{
		String perfId=request.getParameter("perfId");
		
		if(perfId == null || perfId.isEmpty())
		{
			return "redirect:/main/index";
		}
		
		PerfDto pdto=mapper.pDetail(perfId);
		System.out.println("🔍 pdto = " + pdto);
		
		model.addAttribute("pdto", pdto);
		
		return "/performance/pDetail";	
	}
	

}
