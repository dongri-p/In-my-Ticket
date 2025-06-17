package com.example.demo.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.member.MemberDto;

import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("ls")
public class LoginService {

	@Autowired
	private LoginMapper mapper;

	public String login()
	{
		return "/login/login";
	}

	public String loginOk(MemberDto mdto, HttpSession session)
	{
		String name=mapper.loginOk(mdto);
		
		if(name == null)
		{
			return "redirect:/login/login?err=1";
		}
		else
		{
			session.setAttribute("userid", mdto.getUserid());
			session.setAttribute("name", name);
			
			return "redirect:/main/index";
		}
		
	}

	public String logout(HttpSession session)
	{
		session.invalidate();
		
		return "redirect:/main/index";
	}
	
	
}
