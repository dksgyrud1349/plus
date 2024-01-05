package com.fa.plus.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.fa.plus.admin.domain.AnalysisManage;

@Mapper
public interface OnedaypluschartManageMapper {
	public List<AnalysisManage> purposeClassChart();
	public List<AnalysisManage> categoryClassChart();
	public List<AnalysisManage> regionClassChart();
	public List<AnalysisManage> priceClassChart();
	public List<AnalysisManage> ageClassChart();
}
