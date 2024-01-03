package com.fa.plus.admin.domain;

public class InquiryAdManage {
	private long inquiryNum;	//게시물번호
	private String subject;		//게시물제목
	private String content;		//게시물내용
	private String inquiryId;	//문의자(f)-name속성
	private String inquiryDate;	//문의날짜
	private String reInquiryNum; //답변여부
	private String reInquiryId;	//답변자(f)-name속성
	private String reSubject;
	private String reContent;
	private String reInquiryDate;//답변날짜
	private String userName;
	private String secret;		//비밀글.우리가만든것
	
	public long getInquiryNum() {
		return inquiryNum;
	}
	public void setInquiryNum(long inquiryNum) {
		this.inquiryNum = inquiryNum;
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
	public String getInquiryId() {
		return inquiryId;
	}
	public void setInquiryId(String inquiryId) {
		this.inquiryId = inquiryId;
	}
	public String getInquiryDate() {
		return inquiryDate;
	}
	public void setInquiryDate(String inquiryDate) {
		this.inquiryDate = inquiryDate;
	}
	public String getReInquiryNum() {
		return reInquiryNum;
	}
	public void setReInquiryNum(String reInquiryNum) {
		this.reInquiryNum = reInquiryNum;
	}
	public String getReInquiryId() {
		return reInquiryId;
	}
	public void setReInquiryId(String reInquiryId) {
		this.reInquiryId = reInquiryId;
	}
	public String getReSubject() {
		return reSubject;
	}
	public void setReSubject(String reSubject) {
		this.reSubject = reSubject;
	}
	public String getReContent() {
		return reContent;
	}
	public void setReContent(String reContent) {
		this.reContent = reContent;
	}
	public String getReInquiryDate() {
		return reInquiryDate;
	}
	public void setReInquiryDate(String reInquiryDate) {
		this.reInquiryDate = reInquiryDate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}

}
