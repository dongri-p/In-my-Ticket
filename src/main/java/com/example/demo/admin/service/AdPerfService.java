package com.example.demo.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.admin.mapper.AdPerfMapper;

@Service
public class AdPerfService {

	@Autowired
	private AdPerfMapper mapper;
	
	public String plist()
	{
		return "/admin/adPerformance/plist";
	}
	
	
}
