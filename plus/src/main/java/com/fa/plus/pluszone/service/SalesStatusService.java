package com.fa.plus.pluszone.service;

import java.util.List;
import java.util.Map;

public interface SalesStatusService {
	// 오늘 판매 현황
	public Map<String, Object> todayProduct(Map<String, Object> map);
	// 이번달 판매 현황
	public Map<String, Object> thisMonthProduct(Map<String, Object> map);
	public Map<String, Object> thisMonthProduct1();
	// 이전달 판매 현황
	public Map<String, Object> previousMonthProduct(Map<String, Object> map);
	
	public List<Map<String, Object>> dayTotalMoney(Map<String, Object> map);
	public List<Map<String, Object>> monthTotalMoney(Map<String, Object> map);
	public Map<String, Object> dayOfWeekTotalCount(Map<String, Object> map);
}
