package com.example.demo.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.admin.service.AdTimeService;

@Controller
@RequestMapping("/admin/time")
public class AdTimeController {
	
	@Autowired
	private AdTimeService service;
	
	@GetMapping("/tmanage")
	public String tmanage(@RequestParam("perfId") int perfId, Model model)
	{
		return service.tmanage(perfId, model);
	}
	

}
