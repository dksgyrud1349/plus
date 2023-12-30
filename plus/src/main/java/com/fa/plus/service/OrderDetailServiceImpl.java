package com.fa.plus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.OrderDetail;
import com.fa.plus.mapper.OrderDetailMapper;

@Service
public class OrderDetailServiceImpl implements OrderDetailService{

	@Autowired
	private OrderDetailMapper mapper;
	
	@Override
	public long findByNum() {
		long orderNum = 0;
		try {
			orderNum = mapper.findByNum();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return orderNum;
	}
	
	@Override
	public OrderDetail orderList(long orderNum) {
		OrderDetail dto = null;
		try {
			dto = mapper.orderList(orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}



}
