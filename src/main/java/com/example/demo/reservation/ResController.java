package com.example.demo.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpSession;

@Controller
public class ResController {

	@Autowired
	private ResService service;
	
	@GetMapping("/reservation/selectSeat")
	public String selectSeat(HttpSession session)
	{
		return service.selectSeat(session);
	}
	
}
