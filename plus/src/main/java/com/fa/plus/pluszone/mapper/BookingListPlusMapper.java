package com.fa.plus.pluszone.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.pluszone.domain.BookingPlus;

@Mapper
public interface BookingListPlusMapper {

	public List<BookingPlus> bookingList(Map<String, Object> map);
	public int bookingCount(Map<String, Object> map);
	public void updateState(Map<String, Object> map) throws SQLException;
}
