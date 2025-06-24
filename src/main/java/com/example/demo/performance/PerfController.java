package com.example.demo.performance;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class PerfController {
	
	@Autowired
	private PerfService pservice;
	
	@Autowired
	private KopisApiService kaservice;
	
	

}
