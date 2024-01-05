package com.fa.plus.admin.service;

import java.util.List;
import com.fa.plus.admin.domain.AnalysisManage;

public interface OnedaypluschartManageService {
	public List<AnalysisManage> purposeClassChart();
	public List<AnalysisManage> categoryClassChart();
	public List<AnalysisManage> regionClassChart();
	public List<AnalysisManage> priceClassChart();
	public List<AnalysisManage> ageClassChart();
}
