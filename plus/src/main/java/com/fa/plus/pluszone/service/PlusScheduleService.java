package com.fa.plus.pluszone.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.pluszone.domain.PlusSchedule;

public interface PlusScheduleService {
	public void insertSchedule(PlusSchedule dto) throws Exception;
	public void updateSchedule(PlusSchedule dto) throws Exception;
	public void deleteSchedule(Map<String, Object> map) throws Exception;
	
	public void insertSchCategory(Map<String, Object> map) throws Exception;
	public void updateSchCategory(Map<String, Object> map) throws Exception;
	public void deleteSchCategory(Map<String, Object> map) throws Exception;
	
	public PlusSchedule findById(long sNum) throws Exception;
	public List<PlusSchedule> listMonth(Map<String, Object> map) throws Exception ;
	
	public List<PlusSchedule> listCategory(Map<String, Object> map) throws Exception ;
}
