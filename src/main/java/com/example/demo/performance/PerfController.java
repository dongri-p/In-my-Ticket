package com.example.demo.performance;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class PerfController {
	
	@Autowired
	private PerfService pService;
	
	@Autowired
	private KopisApiService kaService;
	
	@GetMapping("/performance/list")
	public String list(@RequestParam String genre, Model model)
	{
		return pService.list(genre, model);
	}
	
	

}
