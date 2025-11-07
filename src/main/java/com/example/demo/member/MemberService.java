package com.example.demo.member;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.reservation.ResDto;

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
	
	@Transactional
	public String cancel(int resId, HttpSession session, RedirectAttributes ra)
	{
		Integer memberId=(Integer)session.getAttribute("memberId");
		
		if(memberId == null)
		{
			return "redirect:/login/login";
		}
		
		ResDto rdto=mapper.findRes(resId);
		
		if(rdto == null || rdto.getMemberId() != memberId)
		{
			ra.addFlashAttribute("message", "예약 정보를 찾을 수 없습니다.");
			
			return "redirect:/member/myticket";
		}
		
		if("cancelled".equalsIgnoreCase(rdto.getStatus()))
		{
			ra.addFlashAttribute("message", "이미 취소된 예약입니다.");
			
			return "redirect:/member/myticket";
		}
		
		int update=mapper.cancelRes(resId);
		// 쿼리 실행이 완료되었으면 rows 1개가 바뀌었다고 뜸. 0보다 크면 성공했다는 뜻
		if(update > 0)
		{
			List<Integer> seatIdList=Arrays.stream(rdto.getSeatIds().split(",")).map(String::trim)
					.filter(s -> !s.isEmpty()).map(Integer::parseInt).collect(Collectors.toList());
			
			mapper.chgSeatStatus(rdto.getPerfId(), rdto.getTimeId(), seatIdList);
		}
		else
		{
			ra.addFlashAttribute("message", "예매 취소 중 오류가 발생했습니다.");
		}
		
		return "redirect:/member/myticket";
	}

}
