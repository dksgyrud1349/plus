package com.fa.plus.domain;

public class OrderDetail {

	private long orderNum;				// 주문번호
	private String cDate;				// 수강날짜
	private String pay;					// 지불한 가격
	private int state;					// 주문상태(0: 예약 대기, 1: 예약 확정, 2: 환불)
	private String className;			// 클래스 이름
	private String userId;				// 회원ID
	private String userName;			// 회원 이름
	private String tel;					// 전화번호
	private String email;				// 이메일
	private int count;					// 인원수
	
	public long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(Long orderNum) {
		this.orderNum = orderNum;
	}
	public String getcDate() {
		return cDate;
	}
	public void setcDate(String cDate) {
		this.cDate = cDate;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
	}
	
}
