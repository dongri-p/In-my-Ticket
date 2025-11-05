package com.example.demo.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

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
			
		return "redirect:../login/login";
	}
	
	public String myticket(HttpSession session, Model model)
	{
		Integer memberId=(Integer)session.getAttribute("memberId");
		
		if(memberId == null)
		{
			return "redirect:/login/login";
		}
		
		List<ResViewDto> rlist=mapper.getReservations(memberId);
		
		model.addAttribute("rlist", rlist);
		
		return "/member/myticket";
	}

	public String cancel(int resId, HttpSession session, Model model)
	{
		return null;
	}

}
