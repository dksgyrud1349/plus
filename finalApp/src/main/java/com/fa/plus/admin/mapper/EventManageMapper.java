package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.EventManage;


@Mapper
public interface EventManageMapper {
	public void insertEvent(EventManage dto) throws SQLException;
	public void updateEvent(EventManage dto) throws SQLException;
	public void deleteEvent(long eventNum) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<EventManage> listEvent(Map<String, Object> map);

	public EventManage findById(long eventNum);
	public void updateHitCount(long eventNum) throws SQLException;
	public EventManage findByPrev(Map<String, Object> map);
	public EventManage findByNext(Map<String, Object> map);
}
