package com.fa.plus.domain;

public class EventReply {
	private long replyNum;
	private String userId;
	private String userName;
	private long eventNum;
	private String erContent;
	private String regDate;
	
	public long getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(long replyNum) {
		this.replyNum = replyNum;
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
	public long getEventNum() {
		return eventNum;
	}
	public void setEventNum(long eventNum) {
		this.eventNum = eventNum;
	}
	public String getErContent() {
		return erContent;
	}
	public void setErContent(String erContent) {
		this.erContent = erContent;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
	
}
