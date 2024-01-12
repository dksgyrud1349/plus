package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.BookingList;
import com.fa.plus.mapper.BookingListMapper;

@Service
public class BookingListServiceImpl implements BookingListService{

	@Autowired
	private BookingListMapper mapper;
	
	@Override
	public List<BookingList> findByOrderNum(String userId) {
		List<BookingList> list = null;
		try {
			list = mapper.findByOrderNum(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BookingList findByClassNum(long orderNum) {
		BookingList dto = null;
		try {
			dto = mapper.findByClassNum(orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public BookingList classInfo(long classNum) {
		BookingList dto = null;
		try {
			dto = mapper.classInfo(classNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public BookingList bookingDetail(Map<String, Object> map) {
		BookingList dto = null;
		try {
			dto = mapper.bookingDetail(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<BookingList> list(Map<String, Object> map) {
		List<BookingList> list = null;
		try {
			list = mapper.list(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int bookCount(long memberIdx) {
		int result = 0;
		try {
			result = mapper.bookCount(memberIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
