package com.fa.plus.admin.service;

import java.util.List;

import com.fa.plus.admin.domain.CategoryManage;

public interface CategoryManageService {
	public void insertMainCategory(CategoryManage dto) throws Exception;
	public void updateMainCategory(CategoryManage dto) throws Exception;
	public void deleteMainCategory(long mainNum) throws Exception;

	public void insertSubCategory(CategoryManage dto) throws Exception;
	public void updateSubCategory(CategoryManage dto) throws Exception;
	public void deleteSubCategory(long subNum) throws Exception;

	public int dataCount();
	public List<CategoryManage> listMainCategory();
	public CategoryManage findByMain(long mainNum);

	public int dataCount2();
	public List<CategoryManage> listSubCategory(long mainNum);
	public CategoryManage findBySub(long subNum);
	
}
