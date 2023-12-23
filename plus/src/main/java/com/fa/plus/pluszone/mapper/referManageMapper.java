package com.fa.plus.pluszone.mapper;


import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.fa.plus.pluszone.domain.referManage;


public interface referManageMapper {
	public void insertrefer(referManage dto) throws SQLException;
	public void updaterefer(referManage dto) throws SQLException;
	public void deleterefer(long num) throws SQLException;
	
	public int dataCount(Map<String, Object> map);
	public List<referManage> listRefer(Map<String, Object> map);
	public List<referManage> listrReferTop(Map<String, Object> map);
	public List<referManage> listReferTitle(Map<String, Object> map);
	public void updateHitCount(long num) throws Exception;
	
	public referManage findById(long num);
	public referManage findByPrev(Map<String, Object> map);
	public referManage findByNext(Map<String, Object> map);
}
