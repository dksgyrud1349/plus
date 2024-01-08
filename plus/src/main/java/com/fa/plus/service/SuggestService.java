package com.fa.plus.service;


import java.util.List;


import com.fa.plus.domain.Suggest;

public interface SuggestService {
	// 제안한 아이디 가져오기
	public Suggest findById(String userId);

	// 클래스 모든 목록 가져오기
	public List<Suggest> findByAllClass();
		
	// 선택한 클래스 번호 가져오기
	public long findByNum(String className);
	
	public void insertSuggest(Suggest dto) throws Exception;
	
	
}
