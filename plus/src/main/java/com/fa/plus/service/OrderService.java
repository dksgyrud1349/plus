package com.fa.plus.service;

import java.sql.SQLException;
import java.util.Map;

import com.fa.plus.domain.Order;

public interface OrderService {
	public void insertOrders(Order dto) throws Exception;
	// public void insertOrderDetail(Order dto) throws Exception;
	
	public Order findLessonDetail(Map<String, Object> map);
	public Order eventLesson(Map<String, Object> map);
	public Order findByOrderHuman(String userId);
	
	public void updateCount(Map<String, Object> map);
	public void updateUmileage(Map<String, Object> map);
	public void updateMileage(Map<String, Object> map);
	
	// 적립금 적립
	public void insertMileage(Order dto) throws SQLException;
	
	// 적립금 사용 (parameter : userId, orderNum, point)
	public void insertUMileage(Order dto) throws SQLException;
}
