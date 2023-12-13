package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Event;

@Mapper
public interface EventMapper {
	public int dataCount(Map<String, Object> map);
	public List<Event> listEvent(Map<String, Object> map);

	public Event findById(long num);
	public void updateHitCount(long num) throws SQLException;
	public Event findByPrev(Map<String, Object> map);
	public Event findByNext(Map<String, Object> map);

}
