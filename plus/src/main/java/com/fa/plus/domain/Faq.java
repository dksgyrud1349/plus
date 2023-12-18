package com.fa.plus.domain;

public class Faq {

	private long num;
	private String subject;
	private String content;
	private String reg_Date;
	private String userId;
	private long cateNum;
	private long gap;
	
	
	public long getGap() {
		return gap;
	}
	public void setGap(long gap) {
		this.gap = gap;
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
	public String getReg_Date() {
		return reg_Date;
	}
	public void setReg_Date(String reg_Date) {
		this.reg_Date = reg_Date;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public long getCateNum() {
		return cateNum;
	}
	public void setCateNum(long cateNum) {
		this.cateNum = cateNum;
	}
	
}
