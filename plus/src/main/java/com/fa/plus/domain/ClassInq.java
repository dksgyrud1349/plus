package com.fa.plus.domain;

public class ClassInq {
	private long inquiryNum;  // 문의 게시물 번호
	
	private String subject;  // 문의 제목
	private String reSubject;
	
	private String content;  // 문의 내용
	private int secret;  // 비밀글 여부(0 : 공개, 1 : 비밀글)
	
	private String inquiryDate;  // 질문 날짜
	private String reInquiryDate;
	
	private long classNum;  // 클래스 번호
	private String inquiryId;  // 답변자
	private String className;
	private int reInquiryNum;  // 답변여부

	private String reContent;
	private String nickName;
	
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
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getReInquiryDate() {
		return reInquiryDate;
	}
	public void setReInquiryDate(String reInquiryDate) {
		this.reInquiryDate = reInquiryDate;
	}
	public int getReInquiryNum() {
		return reInquiryNum;
	}
	public void setReInquiryNum(int reInquiryNum) {
		this.reInquiryNum = reInquiryNum;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
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
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
		this.secret = secret;
	}
	public String getInquiryDate() {
		return inquiryDate;
	}
	public void setInquiryDate(String inquiryDate) {
		this.inquiryDate = inquiryDate;
	}
	public long getClassNum() {
		return classNum;
	}
	public void setClassNum(long classNum) {
		this.classNum = classNum;
	}
	public String getInquiryId() {
		return inquiryId;
	}
	public void setInquiryId(String inquiryId) {
		this.inquiryId = inquiryId;
	}
}
