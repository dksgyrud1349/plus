package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.CategoryManage;

public interface CategoryManageService {
	public int dataCount(Map<String, Object> map);
	
	public void insertCategory(CategoryManage dto) throws Exception;
	public void updateCategory(Map<String, Object> map) throws Exception;
	public void deleteCategory(CategoryManage dto)throws Exception;
	
	public List<CategoryManage> listCategory(Map<String, Object> map);
	
	public CategoryManage findById(String userId);
	
}
