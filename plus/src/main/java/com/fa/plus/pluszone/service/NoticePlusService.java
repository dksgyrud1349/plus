package com.fa.plus.pluszone.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.pluszone.domain.NoticePlus;


public interface NoticePlusService {
	public void insertNotice(NoticePlus dto) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<NoticePlus> listNoticeTop(Map<String, Object> map);
	public List<NoticePlus> listNotice(Map<String, Object> map);
	
	public List<NoticePlus> listTitle(long memberIdx);
		
	public void updateHitCount(long num) throws Exception;
	public NoticePlus findById(long num);
	public NoticePlus findByPrev(Map<String, Object> map);
	public NoticePlus findByNext(Map<String, Object> map);
	
	public void updateNotice(NoticePlus dto) throws Exception;
	public void deleteNotice(long num) throws Exception;
}
