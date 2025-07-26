package com.example.demo.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.demo.admin.service.AdPerfService;

@Controller
public class AdPerfController {
	
	@Autowired
	private AdPerfService service;
	
	@GetMapping("/admin/adPerformance/")
	public String getMethodName(@RequestParam String param) {
		return new String();
	}
	

}
