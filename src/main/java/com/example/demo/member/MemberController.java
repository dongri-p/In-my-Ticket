package com.example.demo.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

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
	
	@GetMapping("/member/useridCheck")
	public @ResponseBody String useridCheck(HttpServletRequest request)
	{
		return service.useridCheck(request);
	}
	
	@PostMapping("/member/memberOk")
	public String memberOk(MemberDto mdto)
	{
		return service.memberOk(mdto);
	}
	
	@GetMapping("/member/myticket")
	public String myticket()
	{
		return service.myticket();
	}
	
	@GetMapping("/member/cancel")
	public String resCancel(@RequestParam("resId") int resId, Model model)
	{
		boolean success=service.cancel(resId);
		
		if(success)
		{
			model.addAttribute("message", "예매 취소가 완료되었습니다.");
		}
		else
		{
			model.addAttribute("message", "취소에 실패했습니다.");
		}
		
		return "redirect:/member/myticket";
	}

}
