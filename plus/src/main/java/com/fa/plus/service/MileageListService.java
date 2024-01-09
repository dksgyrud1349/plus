package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.Mileage;

public interface MileageListService {
	
	public List<Mileage> myMileageList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	// 적립금 번호에 대한 상태 확인
	public Mileage findByMState(Map<String, Object> map);

	// 적립인 적립금 정보
	public Mileage findByMileage(Map<String, Object> map);
}
