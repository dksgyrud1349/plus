package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Order;

@Mapper
public interface OrderMapper {
public String findByMaxOrderNumber();

	public void insertOrders(Order dto) throws SQLException;
	public void insertOrderDetail(Order dto) throws SQLException;
	
	// 결제 테이블에 데이터 insert
	public void insertClassPayDetail() throws SQLException;
	
	// 주문자가 고른 날짜에 해당하는 클래스의 최대 인원수, 상세번호, 날짜 (parameter : classDate, classNum)
	public Order findLessonDetail(Map<String, Object> map);
	
	// 이벤트 클래스 여부 확인
	public Order eventLesson(Map<String, Object> map);
	
	// 주문자의 userId, userName, birth, totalMileage
	public Order findByOrderHuman(String userId);
	
	// 클래스의 인원수에서 주문자의 주문 인원수 빼기 (parameter : detailNum, count)
	public void updateCount(Map<String, Object> map);
	
	// 주문자의 적립금에서 사용 적립금 차감하기 (parameter : userId, uMileage)
	public void updateUmileage(Map<String, Object> map) throws SQLException;
	
	// 주문자의 적립금에 적립하기 (parameter : userId, mileage)
	public void updateMileage(Map<String, Object> map) throws SQLException;
	
	// 적립금 적립
	public void insertMileage(Order dto) throws SQLException;
	
	// 적립금 사용 (parameter : userId, orderNum, point)
	public void insertUMileage(Order dto) throws SQLException;
}
