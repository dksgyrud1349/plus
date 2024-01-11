package com.fa.plus.domain;

public class BookingList {
	private String userId;				// 회원ID
	private long classNum;				// 클래스번호
	private int state;					// 주문상태(0: 예약대기, 1: 예약확정, 2: 환불)
	private String className;			// 클래스이름
	private String addr1;				// 클래스 주소1
	private String addr2;				// 클래스 주소2
	private String userName;			// 회원이름
	private String cDate;				// 수강날짜
	private String oDate;				// 주문일
	private int count;					// 인원수
	private String puserId;				// 플러스ID
	private String puserName;			// 플러스이름
	private String tel;					// 회원전화번호
	private String email;				// 회원이메일
	private String pay;					// 총 지불한 금액
	
	private long orderNum;				// 주문번호
	private String mode;				// state 모드
	
	private int rnum;					// 쿼리에서 차순 정리
	
	private String classDate;           // 수업 일자
	private int memberIdx;
	private long detailNum;
	
	public int getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}

	public long getDetailNum() {
		return detailNum;
	}

	public void setDetailNum(long detailNum) {
		this.detailNum = detailNum;
	}

	public String getClassDate() {
		return classDate;
	}

	public void setClassDate(String classDate) {
		this.classDate = classDate;
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

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getcDate() {
		return cDate;
	}

	public void setcDate(String cDate) {
		this.cDate = cDate;
	}

	public String getoDate() {
		return oDate;
	}

	public void setoDate(String oDate) {
		this.oDate = oDate;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getPuserId() {
		return puserId;
	}

	public void setPuserId(String puserId) {
		this.puserId = puserId;
	}

	public String getPuserName() {
		return puserName;
	}

	public void setPuserName(String puserName) {
		this.puserName = puserName;
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

	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
	}

	public String getMode() {
		return mode;
	}

	public void setMode(String mode) {
		this.mode = mode;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
}
