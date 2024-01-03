package com.fa.plus.admin.domain;

import java.util.List;

public class OnedayplusManage {
	private long num;
	private String subject;
	
	private long plusNum;
	private String content;
	
	private long imgNum;
	private String imgName;
	
	private List<Long> plusNums;
	private List<String> contents;
	private List<Long> imgNums;
	private List<String> imgNames;
	
	public List<Long> getPlusNums() {
		return plusNums;
	}
	public void setPlusNums(List<Long> plusNums) {
		this.plusNums = plusNums;
	}
	public List<String> getContents() {
		return contents;
	}
	public void setContents(List<String> contents) {
		this.contents = contents;
	}
	public List<Long> getImgNums() {
		return imgNums;
	}
	public void setImgNums(List<Long> imgNums) {
		this.imgNums = imgNums;
	}
	public List<String> getImgNames() {
		return imgNames;
	}
	public void setImgNames(List<String> imgNames) {
		this.imgNames = imgNames;
	}
	public long getNum() {
		return num;
	}
	public void setNum(long num) {
		this.num = num;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public long getPlusNum() {
		return plusNum;
	}
	public void setPlusNum(long plusNum) {
		this.plusNum = plusNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public long getImgNum() {
		return imgNum;
	}
	public void setImgNum(long imgNum) {
		this.imgNum = imgNum;
	}
	public String getImgName() {
		return imgName;
	}
	public void setImgName(String imgName) {
		this.imgName = imgName;
	}
	
	
}
