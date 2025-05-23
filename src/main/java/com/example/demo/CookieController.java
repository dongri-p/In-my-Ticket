package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.WebUtils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@RestController
public class CookieController {
	
	@GetMapping("/firstCookie")
	public String firstCookie(HttpServletRequest request,
			HttpServletResponse response)
	{
		try // 이 안에 내용이 오류가 날 경우 여기안에서 해결하기 위해 try catch
		{
			// X를 눌렀다는 표시로 쿠키변수 생성
			Cookie cookie=new Cookie("xcook", "1");
			cookie.setMaxAge(30);
			cookie.setPath("/");
			response.addCookie(cookie);
			
			return "1";
		}
		catch(Exception e)
		{
			return "0";
		}
		
	}
	
	@GetMapping("/xcookOk")
	public String xcookOk(HttpServletRequest request)
	{
		Cookie cookie=WebUtils.getCookie(request, "xcook");
		
		if(cookie == null)
		{
			return "0";
		}
		else
		{
			return "1";
		}
	}

}










