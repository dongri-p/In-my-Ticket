package com.example.demo.admin;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller
public class AdminController {
	
	@Qualifier
	private AdminService service;

}
