package com.fa.plus.pluszone.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.pluszone.domain.PlusInq;

public interface PlusInqService {
	public List<PlusInq> inqList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public PlusInq findByNo(long inquiryNum);
	public PlusInq findByYes(long inquiryNum);
	
	public void insertAnswer(Map<String, Object> map) throws Exception;
	
	public void updateReInquiryNum(Map<String, Object> map) throws Exception;
	
	public void updateAnswer(Map<String, Object> map) throws Exception;
	
	public void deleteAnswer(long inquiryNum) throws Exception;
	
	public void deleteQuestion(long inquiryNum) throws Exception;
	
	// 문의 전체 개수
	public int allInquiry(long memberIdx);
}
