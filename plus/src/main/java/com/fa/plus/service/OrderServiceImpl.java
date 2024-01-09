package com.fa.plus.service;

import java.sql.SQLException;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.Order;
import com.fa.plus.mapper.OrderMapper;

@Service
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderMapper mapper;
	
	@Override
	public void insertOrders(Order dto) throws Exception {
		try {
			mapper.insertOrders(dto);
			mapper.insertOrderDetail(dto);
			mapper.insertClassPayDetail();
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Order findLessonDetail(Map<String, Object> map) {
		Order dto = null;
		
		try {
			dto = mapper.findLessonDetail(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return dto;
	}

	@Override
	public Order findByOrderHuman(String userId) {
		Order dto = null;
		try {
			dto = mapper.findByOrderHuman(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateCount(Map<String, Object> map) {
		try {
			mapper.updateCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateUmileage(Map<String, Object> map) {
		try {
			mapper.updateUmileage(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateMileage(Map<String, Object> map) {
		try {
			mapper.updateMileage(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Order eventLesson(Map<String, Object> map) {
		Order dto = null;
		try {
			dto = mapper.eventLesson(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insertMileage(Order dto) throws SQLException {
		try {
			mapper.insertMileage(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertUMileage(Order dto) throws SQLException {
		try {
			mapper.insertUMileage(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
