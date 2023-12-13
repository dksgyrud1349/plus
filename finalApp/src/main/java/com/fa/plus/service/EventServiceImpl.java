package com.fa.plus.service;

import java.util.List;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.Event;
import com.fa.plus.mapper.EventMapper;

@Service
public class EventServiceImpl implements EventService {
	@Autowired
	private EventMapper mapper;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Event> listEvent(Map<String, Object> map) {
		List<Event> list = null;
		
		try {
			list = mapper.listEvent(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			mapper.updateHitCount(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Event findById(long num) {
		Event dto = null;
		
		try {
			dto = mapper.findById(num);
			
			if(dto != null) {
				dto.setSday(dto.getStartDate().substring(0, 10));
				dto.setStime(dto.getStartDate().substring(11));
				
				dto.setEday(dto.getEndDate().substring(0, 10));
				dto.setEtime(dto.getEndDate().substring(11));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public Event findByPrev(Map<String, Object> map) {
		Event dto = null;
		
		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public Event findByNext(Map<String, Object> map) {
		Event dto = null;
		
		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
}
