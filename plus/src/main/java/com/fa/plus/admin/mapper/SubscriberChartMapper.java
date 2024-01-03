package com.fa.plus.admin.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SubscriberChartMapper {
	
	public Map<String, Object> dayOfMonthSubscriberCount(String month);
	

}
