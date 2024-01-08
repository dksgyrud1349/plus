package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;


import org.apache.ibatis.annotations.Mapper;


import com.fa.plus.domain.Suggest;

@Mapper
public interface SuggestMapper {
	//제안 아이디
	public Suggest findById(String userId);

	// 클래스 모든 목록 가져오기
	public List<Suggest> findByAllClass();
	
	// 선택한 클래스 번호 가져오기
	public long findByNum(String className);
	
	// 제안 등록
	public void insertSuggest(Suggest dto) throws SQLException;
	
	
	
}
