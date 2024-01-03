package com.fa.plus.admin.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class EventManage {
	private long eventNum;
	private String userId;
	private String userName;
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
	
	private MultipartFile selectFile;
	
	
	private long classNum;
	private List<Long> classNums;
	private String className;
	private String memberIdx;
	private String nickName;
	
	public long getEventNum() {
		return eventNum;
	}
	public void setEventNum(long eventNum) {
		this.eventNum = eventNum;
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
	public MultipartFile getSelectFile() {
		return selectFile;
	}
	public void setSelectFile(MultipartFile selectFile) {
		this.selectFile = selectFile;
	}
	public long getClassNum() {
		return classNum;
	}
	public void setClassNum(long classNum) {
		this.classNum = classNum;
	}
	public List<Long> getClassNums() {
		return classNums;
	}
	public void setClassNums(List<Long> classNums) {
		this.classNums = classNums;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(String memberIdx) {
		this.memberIdx = memberIdx;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
}
