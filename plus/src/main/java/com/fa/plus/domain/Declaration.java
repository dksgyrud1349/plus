package com.fa.plus.domain;

public class Declaration {

	private long rNum;				// 신고번호
	private String rContent;		// 신고내용
	private String reportDate;		// 신고일자
	private int result;				// 심사여부(0: 심사대기, 1: 심사승낙, 2: 심사거부)
	private String userId;			// 신고자
	private long classNum;			// 클래스 번호
	
	private String userName;		// 신고자 이름(쿼리에서 가져와 저장)
	private String className;		// 신고자가 신고한 클래스 이름(쿼리에서 가져와 저장)
	
	public long getrNum() {
		return rNum;
	}
	public void setrNum(long rNum) {
		this.rNum = rNum;
	}
	public String getrContent() {
		return rContent;
	}
	public void setrContent(String rContent) {
		this.rContent = rContent;
	}
	public String getReportDate() {
		return reportDate;
	}
	public void setReportDate(String reportDate) {
		this.reportDate = reportDate;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public long getClassNum() {
		return classNum;
	}
	public void setClassNum(long classNum) {
		this.classNum = classNum;
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
}
