package com.fa.plus.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.OrderDetail;

@Mapper
public interface OrderDetailMapper {

	// 현재 orderNum 가져오기
	public long findByNum();
		
	// 결제 내역 관련 정보 가져오기(count, pay, state, cDate)
	public OrderDetail orderList(long orderNum);

}
