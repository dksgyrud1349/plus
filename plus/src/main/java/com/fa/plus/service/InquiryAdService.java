package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.InquiryAd;


public interface InquiryAdService {
	public void insertInquiryAd(InquiryAd dto) throws Exception;
	public void updateInquiryAd(InquiryAd dto) throws Exception;
	public void deleteInquiryAd(long inquiryNum) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<InquiryAd> listInquiryAd(Map<String, Object> map);
	
	public InquiryAd findById(long inquiryNum);

}