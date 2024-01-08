package com.fa.plus.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Suggest;

@Mapper
public interface SuggestManageMapper {

		// 제안 리스트
		public List<Suggest> listSuggest(Map<String, Object>map);
		//페이지 개수
		public int dataCount(Map<String, Object>map);


}
