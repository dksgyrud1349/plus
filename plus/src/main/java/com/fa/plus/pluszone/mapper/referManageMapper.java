package com.fa.plus.pluszone.mapper;


import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.pluszone.domain.referManage;

@Mapper 
public interface referManageMapper {
	public void insertRefer(referManage dto) throws SQLException;
	public void updateRefer(referManage dto) throws SQLException;
	public void deleteRefer(long refNum) throws SQLException;
	
	public List<referManage> listClass(Long memberIdx);
	
	public int dataCount(Map<String, Object> map);
	public List<referManage> listRefer(Map<String, Object> map);
	
	public void updateHitCount(long num) throws Exception;
	
	public referManage findById(long num);
	public referManage findByPrev(Map<String, Object> map);
	public referManage findByNext(Map<String, Object> map);
}
