package com.example.demo.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;


@Controller
public class ResController {

	@Autowired
	private ResService service;
	
	@GetMapping("/reservation/selectSeat")
	public String selectSeat(@RequestParam int perfId, @RequestParam String title, @RequestParam String date,
							 @RequestParam String time, Model model)
	{
		return service.selectSeat(perfId, title, date, time, model);
	}
	
	@GetMapping("/reservation/payment")
	public String payment(@RequestParam int perfId, @RequestParam String title, @RequestParam String date,
						  @RequestParam String time, @RequestParam List<String> seatIds,
						  HttpSession session, Model model)
	{
		return service.payment(perfId, title, date, time, seatIds, session, model);
	}
	
	@PostMapping("/reservation/comPay")
	public String comPay(ResDto rdto, HttpSession session)
	{	
		return service.comPay(rdto, session);
	}
	
	@GetMapping("/reservation/complete")
	public String complete(HttpSession session, Model model)
	{
		return service.complete(session, model);
	}
	
	
}
