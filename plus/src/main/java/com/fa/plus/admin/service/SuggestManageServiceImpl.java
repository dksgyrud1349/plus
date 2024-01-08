package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.mapper.SuggestManageMapper;
import com.fa.plus.domain.Suggest;


@Service
public class SuggestManageServiceImpl implements SuggestManageService{

	@Autowired
	private SuggestManageMapper mapper;

	@Override
	public List<Suggest> listSuggest(Map<String, Object> map) {
		List<Suggest> list = null;
		
		try {
			list = mapper.listSuggest(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {

		int dataCount = 0;
		try {
			dataCount = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dataCount;
	}

}
