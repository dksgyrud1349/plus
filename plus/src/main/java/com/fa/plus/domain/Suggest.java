package com.fa.plus.domain;

public class Suggest {
	
	private long num;
	private String subject;
	private String content;
	private String regDate;
	private String userId;
	private String userName;
	private long memberIdx;
	private String className;
	
	public String getClassName() {
		return className;
	}
	public void setClassName(String classname) {
		this.className = classname;
	}
	private long sugNum;
	
	public long getClassNum() {
		return classNum;
	}
	public void setClassNum(long classNum) {
		this.classNum = classNum;
	}
	private long classNum;
	
	
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
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
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
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public long getSugNum() {
		return sugNum;
	}
	public void setSugNum(long sugNum) {
		this.sugNum = sugNum;
	}
	 
	
}