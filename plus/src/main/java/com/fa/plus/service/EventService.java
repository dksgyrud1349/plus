package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.Event;
import com.fa.plus.domain.EventReply;

public interface EventService {
	public int dataCount(Map<String, Object> map);
	public List<Event> listEvent(Map<String, Object> map);
	
	public void updateHitCount(long eventNum) throws Exception;
	
	public Event findById(long eventNum);
	public Event findByPrev(Map<String, Object> map);
	public Event findByNext(Map<String, Object> map);
	
	public void insertEventLike(Map<String, Object> map) throws Exception;
	public void deleteEventLike(Map<String, Object> map) throws Exception;
	public int eventLikeCount(long eventNum);
	public boolean userEventLiked(Map<String, Object> map);
	
	public void insertReply(EventReply dto) throws Exception;
	public List<EventReply> listReply(Map<String, Object> map);
	public int replyCount(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	
	public List<Event>listEventClass(Map<String, Object> map);
	public int eventClassCount(long eventNum);
}
