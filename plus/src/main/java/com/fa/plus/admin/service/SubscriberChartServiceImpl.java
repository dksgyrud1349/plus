package com.fa.plus.admin.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.mapper.SubscriberChartMapper;

@Service
public class SubscriberChartServiceImpl implements SubscriberChartService {
	@Autowired
	private SubscriberChartMapper mapper;

	@Override
	public Map<String, Object> dayOfWMonthSubscriberCount(String month) {
		Map<String, Object> resultMap = null;
		try {
			resultMap = mapper.dayOfWMonthSubscriberCount(month);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	
	}
	
	
	
}
