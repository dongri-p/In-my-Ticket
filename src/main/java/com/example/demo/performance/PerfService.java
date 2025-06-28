package com.example.demo.performance;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class PerfService {
	
	@Autowired
	private PerfMapper mapper;
	
	public String list(String genre, Model model)
	{
		List<PerfDto> plist=mapper.selectGenre(genre);
		
		model.addAttribute("plist", plist);
		model.addAttribute("plist", plist);
		
		return "/performance/list";
	}
	

}
