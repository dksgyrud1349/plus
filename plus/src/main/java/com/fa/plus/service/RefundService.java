package com.fa.plus.service;

import java.util.Map;

import com.fa.plus.domain.Refund;

public interface RefundService {
	
	// 환불 테이블에 정보 입력
	public void insertRefund(Refund dto) throws Exception;
		
	// 적립된 적립금(0), 사용된 적립금(1) 가져오기
	public Refund findByMileage(Map<String, Object> map);
		
	// 총 적립금에서 적립된 적립금 빼기
	public void updateMinusMileage(Map<String, Object> map) throws Exception;
		
	// 총 적립금에서 사용된 적립금 더하기
	public void updatePlusMileage(Map<String, Object> map) throws Exception;
		
	// 구매한 인원수 구하기
	public Refund findByCount(long orderNum);
		
	// 클래스 상세에서 인원수를 더하기
	public void updatePlusCount(Map<String, Object> map) throws Exception;
	
	public void updateMState(long orderNum) throws Exception;
	
	public void updateState(long orderNum) throws Exception;
}
