package com.fa.plus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.fa.plus.domain.Suggest;
import com.fa.plus.mapper.SuggestMapper;



@Service
public class SuggestServiceImpl implements SuggestService{

	@Autowired
	private SuggestMapper suggestMapper;
	
	@Override
	public void insertSuggest(Suggest dto) throws Exception {
		
		try {
			suggestMapper.insertSuggest(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Suggest findById(String userId) {
		Suggest dto = null;
		
		try {
			dto = suggestMapper.findById(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public long findByNum(String className) {
		long classNum = 0;
		try {
			classNum = suggestMapper.findByNum(className);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return classNum;
	}

	@Override
	public List<Suggest> findByAllClass() {
		List<Suggest> list = null;
		try {
			list = suggestMapper.findByAllClass();
		} catch (Exception e) {

		}
		return list;
	}

}