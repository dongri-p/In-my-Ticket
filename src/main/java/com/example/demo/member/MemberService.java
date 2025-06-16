package com.example.demo.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import jakarta.servlet.http.HttpServletRequest;

@Service
@Qualifier("mems")
public class MemberService {
	
	@Autowired
	private MemberMapper mapper;

	public String member()
	{
		
		return "/member/member";
	}

	public String useridCheck(HttpServletRequest request)
	{
		String userid=request.getParameter("userid");
		
		return mapper.useridCheck(userid).toString();
	}

	public String memberOk(MemberDto mdto)
	{
		mapper.memberOk(mdto);
		
		return "../login/login";
	}

}
