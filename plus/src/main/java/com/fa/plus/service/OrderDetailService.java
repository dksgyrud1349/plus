package com.fa.plus.service;

import com.fa.plus.domain.OrderDetail;

public interface OrderDetailService {

	// 현재 orderNum 가져오기
	public long findByNum();
	
	// 결제 내역 관련 정보 가져오기(count, pay, state, cDate)
	public OrderDetail orderList(long orderNum);
	
}
