package com.fa.plus.pluszone.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.pluszone.domain.LessonPlus;
import com.fa.plus.pluszone.domain.PlusSchedule;

@Mapper
public interface PlusScheduleMapper {

	public void insertSchedule(PlusSchedule dto) throws SQLException;
	public void updateSchedule(PlusSchedule dto) throws SQLException;
	public void deleteSchedule(Map<String, Object> map) throws SQLException;
	
	public void insertSchCategory(Map<String, Object> map) throws SQLException;
	public void updateSchCategory(Map<String, Object> map) throws SQLException;
	public void deleteSchCategory(Map<String, Object> map) throws SQLException;
	
	public PlusSchedule findById(long sNum);
	public List<PlusSchedule> listMonth(Map<String, Object> map);
	
	public List<PlusSchedule> listCategory(Map<String, Object> map);
	public void insertClassCategory(LessonPlus dto) throws SQLException;
	
}
