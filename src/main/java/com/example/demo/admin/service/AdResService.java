package com.example.demo.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.admin.mapper.AdResMapper;

@Service
public class AdResService {
	
	@Autowired
	private AdResMapper mapper;

	public String perfList(String keyword, Model model)
	{
		
		return "/admin/adReserv/perfList";
	}

}
