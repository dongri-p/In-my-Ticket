package com.example.demo.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.admin.dto.AdminDto;
import com.example.demo.admin.mapper.AdminMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;
	
	public String adLogin(HttpServletRequest request, Model model)
	{
		String err=request.getParameter("err");
		
		model.addAttribute("err", err);
		
		return "/admin/adLogin";
	}

	public String adLoginOk(AdminDto adto, HttpSession session)
	{
		String name=mapper.adLoginOk(adto);
		
		if(name == null)
		{
			return "redirect:/admin/login?err=1";
		}
		else
		{
			session.setAttribute("adId", adto.getAdId());
			session.setAttribute("adName", adto.getAdName());
			
			return "redirect:/admin/adIndex";
		}
	}
	
	public String home(HttpSession session, Model model)
	{
		return "/admin/adIndex";
	}

}
