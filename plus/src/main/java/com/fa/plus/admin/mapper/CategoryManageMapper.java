package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.CategoryManage;
@Mapper
public interface CategoryManageMapper {
	public void insertMainCategory(CategoryManage dto) throws SQLException;
	public void updateMainCategory(CategoryManage dto) throws SQLException;
	public void deleteMainCategory(long mainNum) throws SQLException;

	public void insertSubCategory(CategoryManage dto) throws SQLException;
	public void updateSubCategory(CategoryManage dto) throws SQLException;
	public void deleteSubCategory(long subNum) throws SQLException;

	public int dataCount(Map<String, Object> map);
	public List<CategoryManage> listMainCategory(Map<String, Object> map);
	public CategoryManage findByMain(long mainNum);

	public int dataCount2(Map<String, Object> map);
	public List<CategoryManage> listSubCategory(Map<String, Object> map);
	public CategoryManage findBySub(long subNum);
}
