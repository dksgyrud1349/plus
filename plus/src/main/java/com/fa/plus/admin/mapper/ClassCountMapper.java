package com.fa.plus.admin.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
@Mapper

public interface ClassCountMapper {
	public Map<String, Object>dayOfMonthCount(String month);

}
