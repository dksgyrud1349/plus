package com.fa.plus.pluszone.mapper;

import java.util.List;
import java.util.Map;

public interface SalesStatusMapper {
	// 오늘 판매 현황
	public Map<String, Object> todayProduct();
	// 이번달 판매 현황
	public Map<String, Object> thisMonthProduct();
	// 이전달 판매 현황
	public Map<String, Object> previousMonthProduct();
	
	public List<Map<String, Object>> dayTotalMoney(String date);
	public List<Map<String, Object>> monthTotalMoney(String month);
	public Map<String, Object> dayOfWeekTotalCount(String month);
}
