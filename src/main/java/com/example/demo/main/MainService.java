package com.example.demo.main;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.performance.KopisApiService;
import com.example.demo.performance.PerfDto;
import com.example.demo.performance.PerfMapper;

@Service
@Qualifier("ms")
public class MainService {
	
	@Autowired
	private MainMapper mapper;
	
	@Autowired
	private PerfMapper pMapper;
	
	@Autowired
    private KopisApiService kService;
	
	public String index(Model model)
	{
		kService.fetchPerformances();
		
		List<PerfDto> all=pMapper.selectAll();
		List<PerfDto> plist=all.stream().limit(20).toList();
		
		model.addAttribute("plist", plist);
		
		return "/main/index";
	}

}
