package com.fa.plus.pluszone.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.pluszone.domain.InfoDetail;

@Mapper
public interface InfoDetailMapper {
	
	// userId로 저장했던 데이터가 존재하는지 구별(데이터 존재x: mode = write, 데이터 존재o: mode = update)
	public InfoDetail findByNull(String userId);
	
	// mode == write일 때 insert함
	public void insertInfoDetail(InfoDetail dto) throws SQLException;
	
	// mode == update일 때 update함
	public void updateInfoDetail(InfoDetail dto) throws SQLException;
	
}
