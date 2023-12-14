package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Event;
import com.fa.plus.domain.EventReply;

@Mapper
public interface EventMapper {
	public int dataCount(Map<String, Object> map);
	public List<Event> listEvent(Map<String, Object> map);

	public Event findById(long eventNum);
	public void updateHitCount(long eventNum) throws SQLException;
	public Event findByPrev(Map<String, Object> map);
	public Event findByNext(Map<String, Object> map);

	public void insertEventLike(Map<String, Object> map) throws SQLException;
	public void deleteEventLike(Map<String, Object> map) throws SQLException;
	
	public int eventLikeCount(long eventNum);
	public Event userEventLiked(Map<String, Object> map);
	
	public void insertReply(EventReply dto) throws SQLException;
	public int replyCount(Map<String, Object> map);
	public List<EventReply> listReply(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws SQLException;
	
}
