package com.example.demo.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;
	
	public String adLogin()
	{
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
			
			return "redirect:/admin/home";
		}
	}

}
