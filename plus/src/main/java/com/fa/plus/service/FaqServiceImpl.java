package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.Faq;
import com.fa.plus.mapper.FaqMapper;

@Service
public class FaqServiceImpl implements FaqService{

	@Autowired
	private FaqMapper mapper;
	
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
	public List<Faq> listFaq(Map<String, Object> map) {
		List<Faq> list = null;
		
		try {
			list = mapper.listFaq(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Faq findByPrev(Map<String, Object> map) {
		Faq dto = null;
		
		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public Faq findByNext(Map<String, Object> map) {
		Faq dto = null;
		
		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}



	@Override
	public Faq findByFaqNum(long num) {
		Faq dto = null;
		
		try {
			dto = mapper.findByFaqNum(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<Faq> listFaqTop() {
		List<Faq> list = null;
		
		try {
			list = mapper.listFaqTop();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	
}
