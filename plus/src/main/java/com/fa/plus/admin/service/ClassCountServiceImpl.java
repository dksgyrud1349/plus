package com.fa.plus.admin.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.mapper.ClassCountMapper;

@Service
public class ClassCountServiceImpl implements ClassCountService{

	@Autowired
	private ClassCountMapper mapper;
	
	@Override
	public Map<String, Object> dayOfMonthCount(String month) {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = mapper.dayOfMonthCount(month);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return resultMap;
	}

}
