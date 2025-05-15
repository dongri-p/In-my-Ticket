package com.example.demo.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
@Qualifier("ms")
public class MainService {
	
	@Autowired
	private MainMapper mapper;
	
	public String main()
	{
		return "/main/index";
	}

}
