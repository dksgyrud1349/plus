package com.fa.plus.pluszone.domain;

import java.util.List;

public class PluszoneAnswer {
	private String userId;
	private long pluszoneNum;
	private long anszoneNum;
	
	private long num;
	private String subject;
	private String content;
	
	private List<Long> pluszoneNums;
	
	public List<Long> getPluszoneNums() {
		return pluszoneNums;
	}
	public void setPluszoneNums(List<Long> pluszoneNums) {
		this.pluszoneNums = pluszoneNums;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public long getPluszoneNum() {
		return pluszoneNum;
	}
	public void setPluszoneNum(long pluszoneNum) {
		this.pluszoneNum = pluszoneNum;
	}
	public long getAnszoneNum() {
		return anszoneNum;
	}
	public void setAnszoneNum(long anszoneNum) {
		this.anszoneNum = anszoneNum;
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
	
	

}
