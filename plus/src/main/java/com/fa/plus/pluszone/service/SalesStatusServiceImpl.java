package com.fa.plus.pluszone.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.pluszone.mapper.SalesStatusMapper;

@Service
public class SalesStatusServiceImpl implements SalesStatusService{

	@Autowired
	private SalesStatusMapper mapper;
	
	@Override
	public Map<String, Object> todayProduct() {
		Map<String, Object> map =  null;
		try {
			map = mapper.todayProduct();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public Map<String, Object> thisMonthProduct() {
		Map<String, Object> map = null;
		try {
			map = mapper.thisMonthProduct();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public Map<String, Object> previousMonthProduct() {
		Map<String, Object> map = null;
		try {
			map = mapper.previousMonthProduct();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

	@Override
	public List<Map<String, Object>> dayTotalMoney(String date) {
		List<Map<String, Object>> list = null;
		
		try {
			list = mapper.dayTotalMoney(date);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Map<String, Object>> monthTotalMoney(String month) {
		List<Map<String, Object>> list = null;
		
		try {
			list = mapper.monthTotalMoney(month);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Map<String, Object> dayOfWeekTotalCount(String month) {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = mapper.dayOfWeekTotalCount(month);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}
	
}
