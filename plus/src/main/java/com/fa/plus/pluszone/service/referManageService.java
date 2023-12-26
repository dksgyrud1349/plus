package com.fa.plus.pluszone.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.pluszone.domain.referManage;

public interface referManageService {
	public void insertRefer(referManage dto) throws Exception;
	public void updateRefer(referManage dto) throws Exception;
	public void deleteRefer(long Num) throws Exception;
	
	public List<referManage> listClass(Long memberIdx);
	
	public int dataCount(Map<String, Object> map);
	
	
	public List<referManage> listRefer(Map<String, Object> map);
	
	public void updateHitCount(long num) throws Exception;
	
	public referManage findByPrev(Map<String, Object> map);
	public referManage findByNext(Map<String, Object> map);
	
	public referManage findById(long num);
}
