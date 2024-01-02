package com.fa.plus.service;


import java.util.List;
import java.util.Map;

import com.fa.plus.domain.Suggest;

public interface SuggestService {
	
	
	public void insertSuggest(Suggest dto) throws Exception;
	public void updateSuggest(Suggest dto) throws Exception;
	public void deleteSuggest(long sugNum) throws Exception;

	
	public int dataCount(Map <String,Object>map);
	
	public List<Suggest> listSuggest(Map<String, Object>map);
	
	
	public Suggest findById(long num);

}
