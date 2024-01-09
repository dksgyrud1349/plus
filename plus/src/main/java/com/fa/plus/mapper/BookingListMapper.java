package com.fa.plus.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.BookingList;

@Mapper
public interface BookingListMapper {

	// 회원(session)이 주문한 orderNum 전부 가져오기
	public List<BookingList> findByOrderNum(String userId);
	
	// 받은 orderNum으로 주문상태, classNum 가져오기
	public BookingList findByClassNum(long orderNum);
	
	// 받은 classNum으로 클래스 정보 가져오기
	public BookingList classInfo(long classNum);
	
	// 리스트 중 한 개를 클릭하면 모달이 뜨는 데, 그때 보여줄 회원 주문 정보
	public BookingList bookingDetail(Map<String, Object> map);
	
}
