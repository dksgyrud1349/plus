package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.CategoryManage;

public interface CategoryManageService {
	public void insertMainCategory(CategoryManage dto) throws Exception;
	public void updateMainCategory(CategoryManage dto) throws Exception;
	public void deleteMainCategory(long mainNum) throws Exception;

	public void insertSubCategory(CategoryManage dto) throws Exception;
	public void updateSubCategory(CategoryManage dto) throws Exception;
	public void deleteSubCategory(long subNum) throws Exception;

	public int dataCount(Map<String, Object> map);
	public List<CategoryManage> listMainCategory(Map<String, Object> map);
	public CategoryManage findByMain(long mainNum);

	public int dataCount2(Map<String, Object> map);
	public List<CategoryManage> listSubCategory(Map<String, Object> map);
	public CategoryManage findBySub(long subNum);
	
}
