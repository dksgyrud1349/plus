package com.fa.plus.pluszone.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.pluszone.domain.BookingPlus;
import com.fa.plus.pluszone.mapper.BookingPlusMapper;

@Service
public class BookingPlusServiceImpl implements BookingPlusService{
	
	@Autowired
	private BookingPlusMapper mapper;

	@Override
	public List<BookingPlus> lessonList(Map<String, Object> map){
		List<BookingPlus> list = null;
		try {
			 list = mapper.lessonList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map){
		int result = 0;
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<BookingPlus> lessonDetailList(Map<String, Object> map) {
		List<BookingPlus> list = null;
		try {
			list = mapper.lessonDetailList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int detailCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = mapper.detailCount(map); 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

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
