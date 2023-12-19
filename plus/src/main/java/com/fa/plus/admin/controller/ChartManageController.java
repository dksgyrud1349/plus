package com.fa.plus.admin.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.service.ChartManageService;

@Controller
public class ChartManageController {
	@Autowired
	private ChartManageService service;

	@GetMapping("adminChart")
	@ResponseBody
	public Map<String, Object> total() {
		Calendar cal = Calendar.getInstance();
		int y = cal.get(Calendar.YEAR);
		int m = cal.get(Calendar.MONTH) + 1;
		
		String month = String.format("%04d%02d", y, m);
		
		Map<String, Object> dayOfWeek = service.dayOfWeekTotalCount(month);
		if(dayOfWeek != null) {
			dayOfWeek.put("month", month);
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		model.put("dayOfWeek", dayOfWeek);
		
		return model;
	}
}
