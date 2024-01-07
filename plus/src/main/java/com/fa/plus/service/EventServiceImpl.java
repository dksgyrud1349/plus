package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.Event;
import com.fa.plus.domain.EventReply;
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
	public void updateHitCount(long eventNum) throws Exception {
		try {
			mapper.updateHitCount(eventNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Event findById(long eventNum) {
		Event dto = null;
		
		try {
			dto = mapper.findById(eventNum);
			
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

	@Override
	public void insertEventLike(Map<String, Object> map) throws Exception {
		try {
			mapper.insertEventLike(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteEventLike(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteEventLike(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int eventLikeCount(long eventNum) {
		int result = 0;
		try {
			result = mapper.eventLikeCount(eventNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean userEventLiked(Map<String, Object> map) {
		boolean result = false;
		try {
			Event dto = mapper.userEventLiked(map);
			if(dto != null) {
				result = true; 
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void insertReply(EventReply dto) throws Exception {
		try {
			mapper.insertReply(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<EventReply> listReply(Map<String, Object> map) {
		List<EventReply> list = null;
		
		try {
			list = mapper.listReply(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.replyCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteReply(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<Event> listEventClass(Map<String, Object> map) {
		List<Event> list = null;
		try {
			list = mapper.listEventClass(map);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public int eventClassCount(long eventNum) {
		int result = 0;
		try {
			result = mapper.eventClassCount(eventNum);
		} catch (Exception e) {
		}
		return result;
	}
	
}
