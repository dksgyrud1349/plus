package com.fa.plus.pluszone.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.pluszone.domain.BookingPlus;
import com.fa.plus.pluszone.mapper.BookingListPlusMapper;

@Service
public class BookingListPlusServiceImpl implements BookingListPlusService {

	@Autowired
	BookingListPlusMapper mapper;
	
	@Override
	public List<BookingPlus> bookingList(Map<String, Object> map) {
		List<BookingPlus> list = null;
		try {
			list = mapper.bookingList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int bookingCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = mapper.bookingCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void updateState(Map<String, Object> map) throws Exception {
		try {
			mapper.updateState(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
