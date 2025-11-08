package com.example.demo.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.admin.service.AdResService;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

@Controller
public class AdResController {
	
	@Autowired
	private AdResService service;
	
	@GetMapping("/admin/adReserv/perfList")
	public String perfList(@RequestParam(required=false) String keyword, Model model)
	{
		return service.perfList(keyword, model);
	}
	
	@GetMapping("/admin/adResv/rlist")
	public String rlist(@RequestParam int perfId, Model model)
	{
		return service.rlist(perfId, model);
	}

}
