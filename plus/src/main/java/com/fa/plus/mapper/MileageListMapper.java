package com.fa.plus.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Mileage;

@Mapper
public interface MileageListMapper {
	
	public List<Mileage> myMileageList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	// 적립금 번호에 대한 상태 확인
	public Mileage findByMState(Map<String, Object> map);

	// 적립인 적립금 정보
	public Mileage findByMileage(Map<String, Object> map);
	
	// 총 적립금 찾기(마이페이지에서 사용)
	public int findByMyMileage(String userId);
}
