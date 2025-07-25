package com.example.demo.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.admin.dto.AdminDto;
import com.example.demo.admin.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@GetMapping("/admin/adLogin")
	public String adLogin(HttpServletRequest request, Model model)
	{
		return service.adLogin(request, model);
	}
	
	@PostMapping("/admin/adLoginOk")
	public String adLoginOk(AdminDto adto, HttpSession session)
	{
		return service.adLoginOk(adto, session);
	}
	
	@GetMapping("/admin/adIndex")
	public String home(HttpSession session, Model model)
	{
		return service.home(session, model);
	}
	

}
