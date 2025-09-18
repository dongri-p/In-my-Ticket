package com.example.demo.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.admin.service.AdTimeService;
import com.example.demo.performance.PerfDto;
import com.example.demo.performance.PerfMapper;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/admin/time")
public class AdTimeController {
	
	@Autowired
	private AdTimeService service;
	
	@GetMapping("tlist")
	public String tlist(Model model)
	{
		return service.tlist(model);
	}
	
	@GetMapping("/tmanage")
	public String tmanage(@RequestParam("perfId") int perfId, Model model)
	{
		return service.tmanage(perfId, model);
	}
	
	@PostMapping("/tinsert")
	public String tinsert(HttpServletRequest request)
	{
		return service.tinsert(request);
	}
	
	

}
