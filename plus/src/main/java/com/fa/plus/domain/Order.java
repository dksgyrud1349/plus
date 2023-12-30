package com.fa.plus.domain;

public class Order {
	// 주문 테이블
	private long orderNum;  // 주문번호
	private long memberIdx;  // 회원번호
	private long detailNum;  // 클래스 상세 번호
	private long classNum;  // 클래스 번호
	private int discountMoney;
	private String discountPercent;
	private String className;
	
	private String startTime;
	private String endTime;
	
	// 주문 상세
	private int count;  // 인원수(사용자가 입력한)
	private int uMileage;  // 적립금(사용)
	private int pay;  // 결제금액
	private int state;  // 주문 상태(0 : 예약 대기, 1 : 예약 확정, 2 : 환불)
	private String oDate;  // 주문일
	private String classDate;  // 수업 날짜
	
	private int totalMileage;  // 총적립금
	private String userName;  // 이름
	private String birth;  // 생일
	private String userId;
	
	private int price;  // 클래스 가격
	private int mileage;  // 클래스 적립금
	private int count1;  // 최대인원수
	
	private long mNum;
	private int point;
	private String mDate;
	private int mState;
	
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
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
	public long getmNum() {
		return mNum;
	}
	public void setmNum(long mNum) {
		this.mNum = mNum;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getmDate() {
		return mDate;
	}
	public void setmDate(String mDate) {
		this.mDate = mDate;
	}
	public int getmState() {
		return mState;
	}
	public void setmState(int mState) {
		this.mState = mState;
	}
	public long getClassNum() {
		return classNum;
	}
	public void setClassNum(long classNum) {
		this.classNum = classNum;
	}
	public int getDiscountMoney() {
		return discountMoney;
	}
	public void setDiscountMoney(int discountMoney) {
		this.discountMoney = discountMoney;
	}
	public String getDiscountPercent() {
		return discountPercent;
	}
	public void setDiscountPercent(String discountPercent) {
		this.discountPercent = discountPercent;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getuMileage() {
		return uMileage;
	}
	public void setuMileage(int uMileage) {
		this.uMileage = uMileage;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getoDate() {
		return oDate;
	}
	public void setoDate(String oDate) {
		this.oDate = oDate;
	}
	public String getClassDate() {
		return classDate;
	}
	public void setClassDate(String classDate) {
		this.classDate = classDate;
	}
	public int getTotalMileage() {
		return totalMileage;
	}
	public void setTotalMileage(int totalMileage) {
		this.totalMileage = totalMileage;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public int getCount1() {
		return count1;
	}
	public void setCount1(int count1) {
		this.count1 = count1;
	}
}
