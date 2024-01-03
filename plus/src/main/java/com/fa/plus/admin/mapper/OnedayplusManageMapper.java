package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.OnedayplusManage;

@Mapper
public interface OnedayplusManageMapper {
	public long plusSeq();
	
	public void insertOnedayplusQSubject(OnedayplusManage dto) throws SQLException;
	public void updateOnedayplusQSubject(OnedayplusManage dto) throws SQLException;
	public void deleteOnedayplusQSubject(long num) throws SQLException;
	
	public void insertOnedayplusQuestion(OnedayplusManage dto) throws SQLException;
	public void updateOnedayplusQuestion(OnedayplusManage dto) throws SQLException;
	public void deleteOnedayplusQuestion(long plusNum) throws SQLException;
	
	public int dataCount();
	public List<OnedayplusManage> QSubject();
	
	public List<OnedayplusManage> listQuestion();
	
}
