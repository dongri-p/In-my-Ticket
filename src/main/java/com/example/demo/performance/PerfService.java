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
	
	@Autowired
	private KopisApiService kopisApiService;
	
	public String list(String genre, Model model)
	{
		List<PerfDto> plist=mapper.selectGenre(genre);
		
		model.addAttribute("plist", plist);
		model.addAttribute("genre", genre);
		
		return "/performance/list";
	}

	public String pDetail(int perfId, Model model)
	{	
		PerfDto pdto=mapper.pDetail(String.valueOf(perfId));
		
		String mt20id=pdto.getMt20id();
		PerfDto detailDto=kopisApiService.fetchDetail(mt20id);
		
		pdto.setRuntime(detailDto.getRuntime());
		pdto.setGrade(detailDto.getGrade());
		
		model.addAttribute("pdto", pdto);
		
		 System.out.println("mt20id=" + mt20id + ", 관람시간=" + pdto.getRuntime() + ", 관람등급=" + pdto.getGrade());

		
		return "/performance/pDetail";	
	}
	

}
