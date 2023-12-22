package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.CategoryManage;
@Mapper
public interface CategoryManageMapper {
	
	public long mainSeq();
	public void insertMainCategory(CategoryManage dto) throws SQLException;
	public void updateMainCategory(CategoryManage dto) throws SQLException;
	public void deleteMainCategory(long mainNum) throws SQLException;

	public void insertSubCategory(CategoryManage dto) throws SQLException;
	public void updateSubCategory(CategoryManage dto) throws SQLException;
	public void deleteSubCategory(long subNum) throws SQLException;

	public int dataCount();
	public List<CategoryManage> listMainCategory();
	public CategoryManage findByMain(long mainNum);

	public int dataCount2();
	public List<CategoryManage> listSubCategory(long mainNum);
	public CategoryManage findBySub(long subNum);
	
	public void deleteSubCategoryAll(long mainNum) throws SQLException;
}
