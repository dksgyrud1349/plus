package com.fa.plus.admin.service;

import java.util.List;

import java.util.Map;

import com.fa.plus.admin.domain.EventManage;

public interface EventManageService {

	public void insertEvent(EventManage dto) throws Exception;
	public void updateEvent(EventManage dto) throws Exception;
	public void deleteEvent(long num) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<EventManage> listEvent(Map<String, Object> map);
	
	public EventManage findById(long num);
	public void updateHitCount(long num) throws Exception;
	public EventManage findByPrev(Map<String, Object> map);
	public EventManage findByNext(Map<String, Object> map);
		
}
