package com.example.demo.admin;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class AdminService {
	
	@Qualifier
	private AdminMapper mapper;

}
