package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Order;

@Mapper
public interface OrderMapper {
public String findByMaxOrderNumber();
	
	public void insertOrder(Order dto) throws SQLException;
	public void insertPayDetail(Order dto) throws SQLException;
	
	public List<Order> listOrder(Map<String, Object> map);
	public Order findById(long classNum);
	public Order findByDetailId(long detailNum); 
	
	public void insertBook(Order dto) throws SQLException;
}
