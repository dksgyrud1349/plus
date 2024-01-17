package com.fa.plus.pluszone.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.pluszone.domain.FaqPlus;
import com.fa.plus.pluszone.mapper.FaqPlusMapper;

@Service
public class FaqPlusServiceImpl implements FaqPlusService {

	@Autowired
	private FaqPlusMapper mapper;
	
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
	public List<FaqPlus> listFaq(Map<String, Object> map) {
		List<FaqPlus> list = null;
		try {
			list = mapper.listFaq(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<FaqPlus> listCategory(Map<String, Object> map) {
		List<FaqPlus> list = null;
		try {
			list = mapper.listCategory(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
