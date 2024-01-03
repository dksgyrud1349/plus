package com.fa.plus.admin.controller;

import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.service.SubscriberChartService;


	@Controller	
	@RequestMapping("/admin/sub/*")
	public class SubscriberChartController {
		@Autowired
		private SubscriberChartService service;
		
		@GetMapping("list")
		public String main() {
			return ".admin.subscriberChart.list";
		}

		//월별 가입자 수 
		@GetMapping("charts")
		@ResponseBody
		public Map<String, Object> dayofMonth() {
			Calendar cal = Calendar.getInstance();
			int y = cal.get(Calendar.YEAR);
			int m = cal.get(Calendar.MONTH) + 1;
			
			String month = String.format("%04d%02d", y, m);
			Map<String, Object> dayOfMonth = service.dayOfMonthSubscriberCount(month);
			
			
			if(dayOfMonth != null) {
				dayOfMonth.put("month", month);
			}
			
			Map<String, Object> model = new HashMap<String, Object>();
			
			model.put("dayOfMonth", dayOfMonth); // 변경된 부분
			
			
			return model;
		}
	}
