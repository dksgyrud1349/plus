package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.ClassInq;

public interface ClassInqService {
	public void insertInq(ClassInq dto) throws Exception;
	
	public ClassInq findByClassName(long classNum);
	
	public List<ClassInq> myInqList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public ClassInq findByNo(long inquiryNum);
	public ClassInq findByYes(long inquiryNum);
	
	public void updateInq(Map<String, Object> map) throws Exception;
	public void deleteInq(long inquiryNum) throws Exception;
}
