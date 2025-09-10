package com.example.demo.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.admin.service.AdTimeService;

@Controller
public class AdTimeController {
	
	@Autowired
	private AdTimeService service;
	
	@GetMapping("/tmanage")
	public String tmanage()
	{
		return service.tmanage();
	}
	

}
