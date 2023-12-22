package com.fa.plus.admin.domain;

import java.util.List;

public class CategoryManage {
	private long mainNum;
	private String mainName;
	
	private long subNum;
	private String subName;
	
	private long classNum;
	private String className;
	
	private List<Long> subNums;
	private List<String> categorys;
	
	
	public List<Long> getSubNums() {
		return subNums;
	}
	public void setSubNums(List<Long> subNums) {
		this.subNums = subNums;
	}
	public List<String> getCategorys() {
		return categorys;
	}
	public void setCategorys(List<String> categorys) {
		this.categorys = categorys;
	}
	public long getMainNum() {
		return mainNum;
	}
	public void setMainNum(long mainNum) {
		this.mainNum = mainNum;
	}
	public String getMainName() {
		return mainName;
	}
	public void setMainName(String mainName) {
		this.mainName = mainName;
	}
	public long getSubNum() {
		return subNum;
	}
	public void setSubNum(long subNum) {
		this.subNum = subNum;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public long getClassNum() {
		return classNum;
	}
	public void setClassNum(long classNum) {
		this.classNum = classNum;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	
	
}
