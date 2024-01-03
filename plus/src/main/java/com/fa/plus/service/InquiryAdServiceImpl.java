package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.InquiryAd;
import com.fa.plus.mapper.InquiryAdMapper;

@Service
public class InquiryAdServiceImpl implements InquiryAdService{
	@Autowired
	private InquiryAdMapper mapper;
	
	@Override
	public void insertInquiryAd(InquiryAd dto) throws Exception {
		try {
			mapper.insertInquiryAd(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void updateInquiryAd(InquiryAd dto) throws Exception {
		try {
			mapper.updateInquiryAd(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}


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
	public List<InquiryAd> listInquiryAd(Map<String, Object> map) {
		List<InquiryAd> list = null;
		
		try {
			list = mapper.listInquiryAd(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public InquiryAd findById(long inquiryNum) {
		InquiryAd dto = null;
		
		try {
			dto = mapper.findById(inquiryNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}



}
