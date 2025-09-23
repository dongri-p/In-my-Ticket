package com.example.demo.performance;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class PerfController {
	
	@Autowired
	private PerfService pService;
	
	@Autowired
	private KopisApiService kaService;
	
	@GetMapping("/performance/list")
	public String list(@RequestParam String genre, Model model)
	{
		return pService.list(genre, model);
	}
	
	@GetMapping("/performance/pDetail")
	public String pDetail(@RequestParam int perfId, Model model)
	{
		return pService.pDetail(perfId, model);
	}
	
	@GetMapping("pathformance/getShowDate")
	@ResponseBody
	public List<String> getShowDate(@RequestParam int perfId)
	{
		return pService.getShowDate(perfId);
	}
	
	@GetMapping("/performance/getShowTime")
	@ResponseBody
	public List<String> getShowTime(@RequestParam int perfId, @RequestParam String showDate)
	{
	    return pService.getShowTime(perfId, showDate);
	}

	@GetMapping("/performance/getRemainSeat")
	@ResponseBody
	public int getRemainSeat(@RequestParam int perfId, @RequestParam String showDate, @RequestParam String showTime)
	{
	    return pService.getRemainSeat(perfId, showDate, showTime);
	}
	
	
	

}
