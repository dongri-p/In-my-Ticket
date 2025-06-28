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
		
		List<PerfDto> plist=pMapper.selectAll();
		Map<String, List<PerfDto>> pgroup=kService.getGenre();
		
		model.addAttribute("plist", plist);
		model.addAttribute("pgroup", pgroup);
		
		return "/main/index";
	}

}
