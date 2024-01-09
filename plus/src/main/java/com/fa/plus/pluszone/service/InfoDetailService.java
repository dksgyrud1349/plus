package com.fa.plus.pluszone.service;

import java.sql.SQLException;

import com.fa.plus.pluszone.domain.InfoDetail;

public interface InfoDetailService {
	
	// userId로 저장했던 데이터가 존재하는지 구별(데이터 존재x: mode = write, 데이터 존재o: mode = update)
	public InfoDetail findByNull(String userId);
	
	// mode == write일 때 insert함
	public void insertInfoDetail(InfoDetail dto, String pathname) throws Exception;
	
	// mode == update일 때 update함
	public void updateInfoDetail(InfoDetail dto, String pathname) throws SQLException;
}
