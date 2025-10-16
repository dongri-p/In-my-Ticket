package com.example.demo.reservation;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;

@Controller
public class ResController {

	@Autowired
	private ResService service;
	
	@GetMapping("/reservation/selectSeat")
	public String selectSeat(@RequestParam int perfId, @RequestParam String date,
							 @RequestParam String time, Model model)
	{
		return service.selectSeat(perfId, date, time, model);
	}
	
	@GetMapping("/reservation/payment")
	public String payment(@RequestParam int perfId, @RequestParam String date,
						  @RequestParam String time, @RequestParam List<String> seatIds, Model model)
	{
		model.addAttribute("perfId", perfId);
		model.addAttribute("date", date);
		model.addAttribute("time", time);
		model.addAttribute("seatIds", seatIds);
		return "/reservation/payment";
	}
	
}
