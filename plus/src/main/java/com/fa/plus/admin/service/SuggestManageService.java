package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;


import com.fa.plus.domain.Suggest;

public interface SuggestManageService {
	
		// 제안 리스트
		public List<Suggest> listSuggest(Map<String, Object>map);
		
		public int dataCount(Map<String, Object>map);
		

}
