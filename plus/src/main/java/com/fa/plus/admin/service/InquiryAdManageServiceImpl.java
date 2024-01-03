package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.InquiryAdManage;
import com.fa.plus.admin.mapper.InquiryAdManageMapper;

@Service
public class InquiryAdManageServiceImpl implements InquiryAdManageService{
	@Autowired
	private InquiryAdManageMapper mapper;

	@Override
	public void deleteInquiryAd(long inquiryNum) throws Exception {
		try {
			mapper.deleteInquiryAd(inquiryNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public void sendReContentAd(InquiryAdManage dto) throws Exception {
		try {
			mapper.sendReContentAd(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	@Override
	public void deleteReContentAd(long inquiryNum) throws Exception {
		try {
			mapper.deleteReContentAd(inquiryNum);
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
	public List<InquiryAdManage> listInquiryAd(Map<String, Object> map) {
		List<InquiryAdManage> list = null;
		
		try {
			list = mapper.listInquiryAd(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public InquiryAdManage findById(long inquiryNum) {
		InquiryAdManage dto = null;
		
		try {
			dto = mapper.findById(inquiryNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}


}
