package com.fa.plus.admin.service;

import java.util.List;

import com.fa.plus.admin.domain.OnedayplusManage;

public interface OnedayplusManageService {
	
	public void insertOnedayplusQuestion(OnedayplusManage dto) throws Exception;
	public void updateOnedayplusQuestion(OnedayplusManage dto) throws Exception;
	public void deleteOnedayplusQuestion(long num) throws Exception;
	
	public void insertOnedayplusContent(OnedayplusManage dto) throws Exception;
	public void updateOnedayplusContent(OnedayplusManage dto) throws Exception;
	public void deleteOnedayplusContent(long plusNum) throws Exception;
	
	public int dataCount();
	public List<OnedayplusManage> QSubject();
	public List<OnedayplusManage> listQuestion();
}
