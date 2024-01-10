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
	public Map<String, Object> todayProduct(Map<String, Object> map) {
		Map<String, Object> map1 =  null;
		try {
			map1 = mapper.todayProduct(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map1;
	}

	@Override
	public Map<String, Object> thisMonthProduct(Map<String, Object> map) {
		Map<String, Object> map1 = null;
		try {
			map1 = mapper.thisMonthProduct(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map1;
	}
	
	@Override
	public Map<String, Object> thisMonthProduct1() {
		Map<String, Object> map1 = null;
		try {
			map1 = mapper.thisMonthProduct1();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map1;
	}

	@Override
	public Map<String, Object> previousMonthProduct(Map<String, Object> map) {
		Map<String, Object> map1 = null;
		try {
			map1 = mapper.previousMonthProduct(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map1;
	}
	

	@Override
	public List<Map<String, Object>> dayTotalMoney(Map<String, Object> map) {
		List<Map<String, Object>> list = null;
		
		try {
			list = mapper.dayTotalMoney(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Map<String, Object>> monthTotalMoney(Map<String, Object> map) {
		List<Map<String, Object>> list = null;
		
		try {
			list = mapper.monthTotalMoney(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public Map<String, Object> dayOfWeekTotalCount(Map<String, Object> map) {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = mapper.dayOfWeekTotalCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}
	
}
