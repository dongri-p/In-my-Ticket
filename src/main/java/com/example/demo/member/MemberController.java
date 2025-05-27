package com.example.demo.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {
	
	@Autowired
	@Qualifier("mems")
	private MemberService service;
	
	@GetMapping("/member/member")
	public String member()
	{
		return service.member();
	}

}
