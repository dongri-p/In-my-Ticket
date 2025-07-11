package com.example.demo.reservation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResService {

	@Autowired
	private ResMapper mapper;
}
