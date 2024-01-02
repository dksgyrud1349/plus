package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.Suggest;
import com.fa.plus.mapper.SuggestMapper;



@Service
public class SuggestServiceImpl implements SuggestService{

	@Autowired
	private SuggestMapper mapper;

	@Override
	public Suggest findById(long num) {
		Suggest dto = null;
		
		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insertSuggest(Suggest dto) throws Exception {
		try {
			mapper.insertSuggest(dto);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateSuggest(Suggest dto) throws Exception {
		try {
			mapper.updateSuggest(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}
		
	

	@Override
	public void deleteSuggest(long sugNum) throws Exception {
		try {
			mapper.deleteSuggest(sugNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

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

}