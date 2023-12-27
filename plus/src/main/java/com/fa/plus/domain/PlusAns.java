package com.fa.plus.domain;

import java.util.List;

public class PlusAns {
	private long ansNum;
	private long plusNum;
	private String userId;
	private String userName;
	
	private long num;
	private String subject;
	private String content;
	
	private long imgNum;
	private String imgName;
	
	private List<Long> plusNums;
	
	public long getAnsNum() {
		return ansNum;
	}
	public void setAnsNum(long ansNum) {
		this.ansNum = ansNum;
	}
	public long getPlusNum() {
		return plusNum;
	}
	public void setPlusNum(long plusNum) {
		this.plusNum = plusNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public List<Long> getPlusNums() {
		return plusNums;
	}
	public void setPlusNums(List<Long> plusNums) {
		this.plusNums = plusNums;
	}
	
}
