package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.InquiryAdManage;

@Service
public interface InquiryAdManageService {
	public void sendReContentAd(InquiryAdManage dto) throws Exception;
	public void deleteReContentAd(long inquiryNum) throws Exception;
	public void deleteInquiryAd(long inquiryNum) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<InquiryAdManage> listInquiryAd(Map<String, Object> map);
	
	public InquiryAdManage findById(long inquiryNum);
	
}