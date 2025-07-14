package com.example.demo.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpSession;

@Service
public class ResService {

	@Autowired
	private ResMapper mapper;

	public String selectSeat(HttpSession session)
	{
			return "/reservation/selectSeat";
	}
}
