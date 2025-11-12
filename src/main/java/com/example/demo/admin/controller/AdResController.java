package com.example.demo.admin.controller;

import java.lang.ProcessBuilder.Redirect;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@GetMapping("/admin/adReserv/updatePerf")
			// model말고 redirectattribute사용한 이유는 redirect:/로 넘기면 model이 사리지기 때문
	public String updatePerf(RedirectAttributes redirect)
	{
		try
		{
			int count=kopisService.fetchPerformances();
			// flashattribute는 한번만 전달되고 소멸됨
			redirect.addFlashAttribute("message", count + "개의 공연이 추가되었습니다.");
		}
		catch (Exception e)
		{
			e.printStackTrace();
			
			redirect.addFlashAttribute("message", "공연을 불러오는 중 오류가 발생했습니다.");
		}
		
		return "redirect:/admin/adReserv/perfList";
	}

}
