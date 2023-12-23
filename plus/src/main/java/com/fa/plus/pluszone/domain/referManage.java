package com.fa.plus.pluszone.domain;

import org.springframework.web.multipart.MultipartFile;

public class referManage {

	private long num;
	private String subject;
	private String Content;
	private String regDate;
	private long classNum;
	private String refImg;
	private MultipartFile originalFile;
	private String userId;
	private int hitCount;
	
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getRefImg() {
		return refImg;
	}
	public void setRefImg(String refImg) {
		this.refImg = refImg;
	}
	public MultipartFile getOriginalFile() {
		return originalFile;
	}
	public void setOriginalFile(MultipartFile originalFile) {
		this.originalFile = originalFile;
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
		return Content;
	}
	public void setContent(String Content) {
		this.Content = Content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public long getClassNum() {
		return classNum;
	}
	public void setClassNum(long classNum) {
		this.classNum = classNum;
	}
	
}
