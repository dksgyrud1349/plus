package com.fa.plus.admin.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.mapper.ChartManageMapper;

@Service
public class ChartManageServiceImpl implements ChartManageService{
	@Autowired
	private ChartManageMapper mapper;

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
