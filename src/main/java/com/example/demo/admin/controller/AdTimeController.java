package com.example.demo.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.demo.admin.service.AdTimeService;

@Controller
public class AdTimeController {
	
	@Autowired
	private AdTimeService serive;
	

}
