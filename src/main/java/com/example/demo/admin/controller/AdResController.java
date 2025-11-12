package com.example.demo.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.admin.service.AdResService;
import com.example.demo.performance.KopisApiService;
import com.fasterxml.jackson.annotation.JsonCreator.Mode;

@Controller
public class AdResController {
	
	@Autowired
	private AdResService service;
	
	@Autowired
	private KopisApiService kopisService;
	
	@GetMapping("/admin/adReserv/perfList")
	public String perfList(@RequestParam(required=false) String keyword,
						   @RequestParam(defaultValue = "1") int page, Model model)
	{
		return service.perfList(keyword, page, model);
	}
	
	@GetMapping("/admin/adReserv/rlist")
	public String rlist(@RequestParam int perfId, Model model)
	{
		return service.rlist(perfId, model);
	}
	
	@GetMapping("/admin/updatePerformances")
	public String updatePerformances(Model model)
	{
		int count=kopisService.fetchPerformances();
		
		model.addAttribute("msg", count + "개의 공연이 추가되었습니다.");
		
		return "redirect:/admin/adReserv/perfList";
	}

}
