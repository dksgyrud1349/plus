package com.fa.plus.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.AnalysisManage;
import com.fa.plus.admin.mapper.OnedaypluschartManageMapper;

@Service
public class OnedaypluschartManageServiceImpl implements OnedaypluschartManageService{
	@Autowired
	private OnedaypluschartManageMapper mapper;
	
	@Override
	public List<AnalysisManage> purposeClassChart() {
		List<AnalysisManage> list = null;
		
		try {
			list = mapper.purposeClassChart();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<AnalysisManage> categoryClassChart() {
		List<AnalysisManage> list = null;
		
		try {
			list = mapper.categoryClassChart();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<AnalysisManage> regionClassChart() {
		List<AnalysisManage> list = null;
		
		try {
			list = mapper.regionClassChart();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<AnalysisManage> priceClassChart() {
		List<AnalysisManage> list = null;
		
		try {
			list = mapper.priceClassChart();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<AnalysisManage> ageClassChart() {
		List<AnalysisManage> list = null;
		
		try {
			list = mapper.ageClassChart();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
