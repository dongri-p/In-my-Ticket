package com.example.demo.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
	
	@Autowired
	private AdminMapper mapper;
	
	public String adLogin()
	{
		return "/admin/adLogin";
	}

}
