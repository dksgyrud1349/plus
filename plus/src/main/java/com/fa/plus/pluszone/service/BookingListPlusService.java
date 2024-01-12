package com.fa.plus.pluszone.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.pluszone.domain.BookingPlus;

public interface BookingListPlusService {
	public List<BookingPlus> bookingList(Map<String, Object> map);
	public int bookingCount(Map<String, Object> map);
	public void updateState(Map<String, Object> map) throws Exception;
}
