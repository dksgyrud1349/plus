package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.TermsManage;
import com.fa.plus.admin.mapper.TermsManageMapper;

@Service
public class TermsManageServiceImpl implements TermsManageService{
	@Autowired
	private TermsManageMapper mapper;
	
	@Override
	public List<TermsManage> listTerms(Map<String, Object> map) {
		List<TermsManage> list = null;
		
		try {
			list = mapper.listTerms(map);
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
	public void insertTerms(TermsManage dto) throws Exception {
		try {
			mapper.insertTerms(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void updateTerms(TermsManage dto) throws Exception {
		try {
			mapper.updateTerms(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteTerms(long num) throws Exception {
		try {
			mapper.deleteTerms(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public TermsManage findById(long num) {
		TermsManage dto = null;
		
		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public TermsManage findByPrev(Map<String, Object> map) {
		TermsManage dto = null;
		
		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public TermsManage findByNext(Map<String, Object> map) {
		TermsManage dto = null;
		
		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

}
