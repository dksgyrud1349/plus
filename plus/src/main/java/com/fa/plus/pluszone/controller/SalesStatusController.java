package com.fa.plus.pluszone.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.domain.SessionInfo;
import com.fa.plus.pluszone.service.SalesStatusService;

@Controller
@RequestMapping("/pluszone/salesStatus/*")
public class SalesStatusController {

	@Autowired
	private SalesStatusService service;
	
	@RequestMapping("main")
	public String main(Model model, HttpSession session) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if(info == null) {
			return "redirect:/member/login";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberIdx", info.getMemberIdx());
		
		Map<String, Object> today =  service.todayProduct(map);
		Map<String, Object> thisMonth = service.thisMonthProduct(map);
		Map<String, Object> previousMonth = service.previousMonthProduct(map);
		
		model.addAttribute("today", today);
		model.addAttribute("thisMonth", thisMonth);
		model.addAttribute("previousMonth", previousMonth);
		
		return ".pluszone.salesStatus.main";
	}
	
	@GetMapping("charts")
	@ResponseBody
	public Map<String, Object> total(HttpSession session){
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		int d = cal.get(Calendar.DATE);
		
		String date = String.format("%04d-%02d-%02d", y, m, d);
		String month = String.format("%04d%02d", y, m);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("date", date);
		map.put("memberIdx", info.getMemberIdx());
		List<Map<String, Object>> days = service.dayTotalMoney(map);
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("month", month);
		map2.put("memberIdx", info.getMemberIdx());
		List<Map<String, Object>> months = service.monthTotalMoney(map2);

		if(d < 20) {
			cal.add(Calendar.MONTH, -1);
			m = cal.get(Calendar.MONTH) + 1;
			if(m == 12) {
				y = y - 1;
			}
			month = String.format("%04d%02d", y, m);
		}
		
		Map<String, Object> map3 = new HashMap<String, Object>();
		map3.put("month", month);
		map3.put("memberIdx", info.getMemberIdx());
		Map<String, Object> dayOfWeek = service.dayOfWeekTotalCount(map3);
		
		dayOfWeek.put("month", month);
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("days", days);
		model.put("months", months);
		model.put("dayOfWeek", dayOfWeek);
		
		return model;
	}
}
