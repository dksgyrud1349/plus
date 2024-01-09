package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Refund;

@Mapper
public interface RefundMapper {
	// 환불 테이블에 정보 입력
	public void insertRefund(Refund dto) throws SQLException;
	
	// 적립된 적립금(0), 사용된 적립금(1) 가져오기
	public Refund findByMileage(Map<String, Object> map);
	
	// 총 적립금에서 적립된 적립금 빼기
	public void updateMinusMileage(Map<String, Object> map) throws SQLException;
	
	// 총 적립금에서 사용된 적립금 더하기
	public void updatePlusMileage(Map<String, Object> map) throws SQLException;
	
	// 구매한 인원수 구하기
	public Refund findByCount(long orderNum);
	
	// 클래스 상세에서 인원수를 더하기
	public void updatePlusCount(Map<String, Object> map) throws SQLException;
	
	// 적립금 내역에서 상태를 환불로 바꾸기
	public void updateMState(long orderNum) throws SQLException;
	
	// 주문 상세에서 주문 상태를 환불(2)로 바꾸기
	public void updateState(long orderNum) throws SQLException;
}
