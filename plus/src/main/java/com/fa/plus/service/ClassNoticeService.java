package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.ClassNotice;

public interface ClassNoticeService {
	public List<ClassNotice> notices(long classNum);
	public List<ClassNotice> noticeList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public ClassNotice findById(long classNum);
	
	public void updateHitCount(long num) throws Exception;
	
	public ClassNotice findByPrev(Map<String, Object> map);
	
	public ClassNotice findByNext(Map<String, Object> map);
}
