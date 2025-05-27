package com.example.demo.main;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@Autowired
	@Qualifier("ms")
	private MainService service;
	
	@GetMapping("/")
	public String home()
	{
		return "redirect:/main/index";
	}
	
	@GetMapping("/main/index")
	public String main()
	{
		return service.main();
	}
	

}
