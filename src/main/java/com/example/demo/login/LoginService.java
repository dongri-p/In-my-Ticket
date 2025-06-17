package com.example.demo.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
@Qualifier("ls")
public class LoginService {

	@Autowired
	private LoginMapper mapper;

	public String login()
	{
		// TODO Auto-generated method stub
		return "/login/login";
	}
	
	
}
