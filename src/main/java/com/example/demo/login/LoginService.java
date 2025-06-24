package com.example.demo.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.MyUtil;
import com.example.demo.member.MemberDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("ls")
public class LoginService {

	@Autowired
	private LoginMapper mapper;

	public String login(HttpServletRequest request, Model model)
	{
		String err=request.getParameter("err");
		
		model.addAttribute("err", err);
		
		return "/login/login";
	}

	public String loginOk(MemberDto mdto, HttpSession session)
	{
		String name=mapper.loginOk(mdto);
		
		if(name == null)
		{
			return "redirect:/login/login?err=1";
		}
		else
		{
			session.setAttribute("userid", mdto.getUserid());
			session.setAttribute("name", name);
			
			return "redirect:/main/index";
		}
		
	}

	public String logout(HttpSession session)
	{
		session.invalidate();
		
		return "redirect:/main/index";
	}

	public String fUserid()
	{
		return "/login/fUserid";
	}
	
	public String getUserid(MemberDto mdto)
	{
		String userid=mapper.getUserid(mdto);
		
		if (userid != null)
		{
		    return userid;
		}
		else
		{
		    return "존재하지 않는 사용자입니다.";
		}

	}

	public String fPwd()
	{		
		return "/login/fPwd";
	}

	public String getPwd(MemberDto mdto)
	{
		String pwd=mapper.getPwd(mdto);
		
		if(pwd != null)
		{
			String imsiPwd=MyUtil.getNewPwd();
			
			return "임시 비밀번호 : "+newPwd;
		}
		else
			return "정보가 일치하지 않습니다";
	}

}
