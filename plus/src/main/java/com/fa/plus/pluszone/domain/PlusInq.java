package com.fa.plus.pluszone.domain;

public class PlusInq {
	private long inquiryNum;  // 문의 게시물 번호
	
	private String subject;  // 문의 제목
	private String reSubject; // 답변 제목
	
	private String inquiryDate;  // 질문 날짜
	private String reInquiryDate;  // 답변 날짜
	
	private long reInquiryNum;  // 답변여부
	
	private long classNum;  // 클래스번호
	private long memberIdx;  // 회원번호
	private String className;
	
	private String content;
	private String reContent;
	
	private String inquiryId;
	private String reInquiryId;
	
	private String userName;
	private String nickName;
	
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
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
	public String getReInquiryId() {
		return reInquiryId;
	}
	public void setReInquiryId(String reInquiryId) {
		this.reInquiryId = reInquiryId;
	}
	public String getInquiryId() {
		return inquiryId;
	}
	public void setInquiryId(String inquiryId) {
		this.inquiryId = inquiryId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	public String getInquiryDate() {
		return inquiryDate;
	}
	public void setInquiryDate(String inquiryDate) {
		this.inquiryDate = inquiryDate;
	}
	public String getReInquiryDate() {
		return reInquiryDate;
	}
	public void setReInquiryDate(String reInquiryDate) {
		this.reInquiryDate = reInquiryDate;
	}
	public long getReInquiryNum() {
		return reInquiryNum;
	}
	public void setReInquiryNum(long reInquiryNum) {
		this.reInquiryNum = reInquiryNum;
	}
	public long getClassNum() {
		return classNum;
	}
	public void setClassNum(long classNum) {
		this.classNum = classNum;
	}
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
}
