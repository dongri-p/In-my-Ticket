package com.example.demo.performance;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PerfController {
	
	@Autowired
	private PerfService pService;
	
	@Autowired
	private KopisApiService kaService;
	
	/*
	 * @GetMapping("/api/test") public String fetchPerformancesTest() {
	 * kaService.fetchPerformances(); return "공연 목록 콘솔에 출력"; }
	 */
	
	

}
