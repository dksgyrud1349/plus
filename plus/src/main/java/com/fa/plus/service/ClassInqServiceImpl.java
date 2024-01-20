package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.ClassInq;
import com.fa.plus.mapper.ClassInqMapper;

@Service
public class ClassInqServiceImpl implements ClassInqService{

	@Autowired
	private ClassInqMapper mapper;
	
	@Override
	public void insertInq(ClassInq dto) throws Exception {
		try {
			mapper.insertInq(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<ClassInq> myInqList(Map<String, Object> map) {
		List<ClassInq> list = null;
		try {
			list = mapper.myInqList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
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
	public ClassInq findByClassName(long classNum) {
		ClassInq dto = null;
		try {
			dto = mapper.findByClassName(classNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public ClassInq findByNo(long inquiryNum) {
		ClassInq dto = null;
		try {
			dto = mapper.findByNo(inquiryNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public ClassInq findByYes(long inquiryNum) {
		ClassInq dto = null;
		try {
			dto = mapper.findByYes(inquiryNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateInq(Map<String, Object> map) throws Exception {
		try {
			mapper.updateInq(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteInq(long inquiryNum) throws Exception {
		try {
			mapper.deleteInq(inquiryNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
}
