package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.EventManage;
import com.fa.plus.admin.mapper.EventManageMapper;
import com.fa.plus.common.FileManager;

@Service
public class EventManageServiceImpl implements EventManageService {
	@Autowired
	private EventManageMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public void insertEvent(EventManage dto, String pathname) throws Exception {
		try {
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);
			if (saveFilename != null) {
				dto.setEventImg(saveFilename);;
			}
			dto.setStartDate(dto.getSday() + " " + dto.getStime() + ":00");
			dto.setEndDate(dto.getEday() + " " + dto.getEtime() + ":00");
			
			mapper.insertEvent(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateEvent(EventManage dto, String pathname) throws Exception {
		try {
			// 업로드한 파일이 존재한 경우
			String saveFilename = fileManager.doFileUpload(dto.getSelectFile(), pathname);

			if (saveFilename != null) {
				// 이전 파일 지우기
				if (dto.getEventImg().length() != 0) {
					fileManager.doFileDelete(dto.getEventImg(), pathname);
				}

				dto.setEventImg(saveFilename);
			}
			dto.setStartDate(dto.getSday() + " " + dto.getStime() + ":00");
			dto.setEndDate(dto.getEday() + " " + dto.getEtime() + ":00");
			
			mapper.updateEvent(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteEvent(long eventNum, String pathname) throws Exception {
		try {
			if (pathname != null) {
				fileManager.doFileDelete(pathname);
			}
			mapper.deleteEvent(eventNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

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
	public List<EventManage> listEvent(Map<String, Object> map) {
		List<EventManage> list = null;
		
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
	public EventManage findById(long eventNum) {
		EventManage dto = null;
		
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
	public EventManage findByPrev(Map<String, Object> map) {
		EventManage dto = null;
		
		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	@Override
	public EventManage findByNext(Map<String, Object> map) {
		EventManage dto = null;
		
		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public List<EventManage> classList(Map<String, Object> map) {
		List<EventManage> list = null;
		try {
			list = mapper.searchClass(map);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public List<EventManage> eventClassList(long eventNum) {
		List<EventManage> list = null;
		try {
			list = mapper.eventClassList(eventNum);
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public int classDataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = mapper.classDataCount(map);
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public void deleteEventClass(long classNum) throws Exception {
		try {
			mapper.deleteEventClass(classNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertEventClass(EventManage dto) throws Exception {
		try {
			mapper.insertEventClass(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
