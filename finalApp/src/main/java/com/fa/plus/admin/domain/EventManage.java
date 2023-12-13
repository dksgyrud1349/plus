package com.fa.plus.admin.domain;

public class EventManage {
	private long evnetNum;
	private String userId;
	private String subject;
	private String eContent;
	private String startDate;
	private String sday;
	private String stime;
	private String endDate;
	private String eday;
	private String etime;
	private String eventKind;
	private int discountMoney;
	private double discountPercent;
	private int showEvent;
	private int hitCount;
	private String eventImg;
	
	public long getEvnetNum() {
		return evnetNum;
	}
	public void setEvnetNum(long evnetNum) {
		this.evnetNum = evnetNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String geteContent() {
		return eContent;
	}
	public void seteContent(String eContent) {
		this.eContent = eContent;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getSday() {
		return sday;
	}
	public void setSday(String sday) {
		this.sday = sday;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getEday() {
		return eday;
	}
	public void setEday(String eday) {
		this.eday = eday;
	}
	public String getEtime() {
		return etime;
	}
	public void setEtime(String etime) {
		this.etime = etime;
	}
	public String getEventKind() {
		return eventKind;
	}
	public void setEventKind(String eventKind) {
		this.eventKind = eventKind;
	}
	public int getDiscountMoney() {
		return discountMoney;
	}
	public void setDiscountMoney(int discountMoney) {
		this.discountMoney = discountMoney;
	}
	public double getDiscountPercent() {
		return discountPercent;
	}
	public void setDiscountPercent(double discountPercent) {
		this.discountPercent = discountPercent;
	}
	public int getShowEvent() {
		return showEvent;
	}
	public void setShowEvent(int showEvent) {
		this.showEvent = showEvent;
	}
	public int getHitCount() {
		return hitCount;
	}
	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}
	public String getEventImg() {
		return eventImg;
	}
	public void setEventImg(String eventImg) {
		this.eventImg = eventImg;
	}
	
}
