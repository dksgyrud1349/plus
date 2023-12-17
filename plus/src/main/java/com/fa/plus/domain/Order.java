package com.fa.plus.domain;

public class Order {
	private long orderNum; // orders table
	private String oDate;
	private int tMoney;
	private int uMileage;
	private int state;
	private int count;
	private long memberIdx;

	private long detailNum;
	private String startTime;
	private String endTime;
	
	private long classNum; // lesson table
	private String className;
	private int price;
	private String firstPhoto;
	
	private String userId;

	// 결제 내역 정보
	private String payMethod;
	private String cardName;
	private String authNumber;
	private String authDate;
	
	// 예약
	private long bookNum;
	private int bookState;
	
	public long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
	}
	public String getoDate() {
		return oDate;
	}
	public void setoDate(String oDate) {
		this.oDate = oDate;
	}
	public int gettMoney() {
		return tMoney;
	}
	public void settMoney(int tMoney) {
		this.tMoney = tMoney;
	}
	public int getuMileage() {
		return uMileage;
	}
	public void setuMileage(int uMileage) {
		this.uMileage = uMileage;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public long getDetailNum() {
		return detailNum;
	}
	public void setDetailNum(long detailNum) {
		this.detailNum = detailNum;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public long getClassNum() {
		return classNum;
	}
	public void setClassNum(long classNum) {
		this.classNum = classNum;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getFirstPhoto() {
		return firstPhoto;
	}
	public void setFirstPhoto(String firstPhoto) {
		this.firstPhoto = firstPhoto;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getCardName() {
		return cardName;
	}
	public void setCardName(String cardName) {
		this.cardName = cardName;
	}
	public String getAuthNumber() {
		return authNumber;
	}
	public void setAuthNumber(String authNumber) {
		this.authNumber = authNumber;
	}
	public String getAuthDate() {
		return authDate;
	}
	public void setAuthDate(String authDate) {
		this.authDate = authDate;
	}
	public long getBookNum() {
		return bookNum;
	}
	public void setBookNum(long bookNum) {
		this.bookNum = bookNum;
	}
	public int getBookState() {
		return bookState;
	}
	public void setBookState(int bookState) {
		this.bookState = bookState;
	}

	
}
