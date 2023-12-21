package com.fa.plus.domain;

public class Faq {

	private long num;
	private String subject;
	private String content;
	private String regDate;
	private String userId;
	
	private long cateNum;
	private String faqName;
	private int showFaq; // 
	private int showUser; //
	private int orderNo;
	
	
	public String getFaqName() {
		return faqName;
	}
	public void setFaqName(String faqName) {
		this.faqName = faqName;
	}
	public int getShowFaq() {
		return showFaq;
	}
	public void setShowFaq(int showFaq) {
		this.showFaq = showFaq;
	}
	public int getShowUser() {
		return showUser;
	}
	public void setShowUser(int showUser) {
		this.showUser = showUser;
	}
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
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
		return regDate;
	}
	public void setReg_Date(String reg_Date) {
		this.regDate = reg_Date;
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
