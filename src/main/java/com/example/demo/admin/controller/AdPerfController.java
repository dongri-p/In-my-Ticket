package com.example.demo.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.admin.service.AdPerfService;

@Controller
public class AdPerfController {
	
	@Autowired
	private AdPerfService service;
	
	@GetMapping("/admin/adPerformance/adPerflist")
	public String adPerfList(Model model)
	{
		return service.adPerfList(model);
	}
	

}
