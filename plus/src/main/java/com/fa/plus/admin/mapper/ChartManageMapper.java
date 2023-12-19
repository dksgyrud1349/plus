package com.fa.plus.admin.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChartManageMapper {
	public Map<String, Object> dayOfWeekTotalCount(String month);
}
