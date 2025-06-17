package com.example.demo.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.example.demo.member.MemberDto;

@Service
@Qualifier("ls")
public class LoginService {

	@Autowired
	private LoginMapper mapper;

	public String login()
	{
		return "/login/login";
	}

	public String loginOk(MemberDto mdto)
	{
		mapper.loginOk(mdto);
		
		return null;
	}
	
	
}
