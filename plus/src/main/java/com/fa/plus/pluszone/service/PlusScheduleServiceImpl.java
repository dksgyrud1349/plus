package com.fa.plus.pluszone.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.pluszone.domain.LessonPlus;
import com.fa.plus.pluszone.domain.PlusSchedule;
import com.fa.plus.pluszone.mapper.PlusScheduleMapper;

@Service
public class PlusScheduleServiceImpl implements PlusScheduleService {
	
	@Autowired
	private PlusScheduleMapper mapper;
	
	@Override
	public void insertSchedule(PlusSchedule dto) throws Exception {
		try {
			if(dto.getAllDay() != null) {
				dto.setsTime("");
				dto.seteTime("");
			}
			if(dto.getsTime().length() == 0 && dto.geteTime().length() == 0
					&& dto.getsDay().equals(dto.geteDay())) {
				dto.seteDay("");
			}
			mapper.insertSchedule(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateSchedule(PlusSchedule dto) throws Exception {
		try {
			if(dto.getAllDay() != null) {
				dto.setsTime("");
				dto.seteTime("");
			}
			if(dto.getsTime().length() == 0 && dto.geteTime().length() == 0
					&& dto.getsDay().equals(dto.geteDay())) {
				dto.seteDay("");
			}
			
			mapper.updateSchedule(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteSchedule(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteSchedule(map);
		} catch (Exception e) {
			throw e;
		}
	}

	@Override
	public void insertSchCategory(Map<String, Object> map) throws Exception {
		try {
			mapper.insertSchCategory(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateSchCategory(Map<String, Object> map) throws Exception {
		try {
			mapper.updateSchCategory(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteSchCategory(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteSchCategory(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public PlusSchedule findById(long sNum) throws Exception {
		PlusSchedule dto = null;
		try {
			dto = mapper.findById(sNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return dto;
	}

	@Override
	public List<PlusSchedule> listMonth(Map<String, Object> map) throws Exception {
		List<PlusSchedule> list = null;
		try {
			list = mapper.listMonth(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	@Override
	public List<PlusSchedule> listCategory(Map<String, Object> map) throws Exception {
		List<PlusSchedule> list = null;
		try {
			list = mapper.listCategory(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	@Override
	public void insertClassCategory(LessonPlus dto) throws Exception {
		try {
			mapper.insertClassCategory(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public List<PlusSchedule> todaySchedule(String userId) {
		List<PlusSchedule> list = null;
		try {
			list = mapper.todaySchedule(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
