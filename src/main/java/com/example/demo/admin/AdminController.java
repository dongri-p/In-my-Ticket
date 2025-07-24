package com.example.demo.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;


@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@GetMapping("/admin/adLogin")
	public String adLogin()
	{
		return service.adLogin();
	}
	
	@PostMapping("/admin/adLoginOk")
	public String adLoginOk(AdminDto adto, HttpSession session)
	{
		return service.adLoginOk(adto, session);
	}
	

}
