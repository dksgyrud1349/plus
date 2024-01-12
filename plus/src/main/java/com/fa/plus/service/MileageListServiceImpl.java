package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.Mileage;
import com.fa.plus.mapper.MileageListMapper;

@Service
public class MileageListServiceImpl implements MileageListService{

	@Autowired
	private MileageListMapper mapper;

	@Override
	public List<Mileage> myMileageList(Map<String, Object> map) {
		List<Mileage> list = null;
		try {
			list = mapper.myMileageList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
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
	public Mileage findByMState(Map<String, Object> map) {
		Mileage dto = null;
		try {
			dto = mapper.findByMState(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Mileage findByMileage(Map<String, Object> map) {
		Mileage dto = null;
		try {
			dto = mapper.findByMileage(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int findByMyMileage(String userId) {
		int result = 0;
		try {
			result = mapper.findByMyMileage(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}


}
