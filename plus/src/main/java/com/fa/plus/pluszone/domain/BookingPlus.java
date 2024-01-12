package com.fa.plus.pluszone.domain;

public class BookingPlus {
	private long memberIdx;  // 회원번호
	private String userId;  // 아이디
	private String birth;  // 생년월일
	private String tel;  // 전화번호
	
	private long orderNum;  // 주문번호
	private int orderCount;  // 주문 인원수
	private int state;  // 예약상태번호
	private String stateName;  // 예약 상태
	private String oDate;  // 주문일
	private String cDate;  // 수강할 날짜
	
	private int approvalCode;  // 승인 코드 번호
	
	private long classNum;  // 클래스 번호
	private String className;  // 클래스 이름
	private int price;
	
	private long subNum;  // 서브 카테고리 번호
	private String subName;  // 서브 카테고리 이름
	
	private long mainNum;  // 메인 카테고리 번호
	private String mainName;  // 메인 카테고리 이름
	
	private long tagNum;  // 태그 번호
	private String tagName;  // 태그 이름
	
	private String startDate;  // 시작일
	private String endDate;  // 종료일
	private String regDate;  // 등록일
	
	private long detailNum;  // 클래스 상세 번호
	private String classDate;  // 클래스 날짜
	private int count;  // 최대 인원수
	
	public String userName;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getStateName() {
		return stateName;
	}
	public void setStateName(String stateName) {
		this.stateName = stateName;
	}
	public String getoDate() {
		return oDate;
	}
	public void setoDate(String oDate) {
		this.oDate = oDate;
	}
	public String getcDate() {
		return cDate;
	}
	public void setcDate(String cDate) {
		this.cDate = cDate;
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
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public int getApprovalCode() {
		return approvalCode;
	}
	public void setApprovalCode(int approvalCode) {
		this.approvalCode = approvalCode;
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
	public long getSubNum() {
		return subNum;
	}
	public void setSubNum(long subNum) {
		this.subNum = subNum;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public long getMainNum() {
		return mainNum;
	}
	public void setMainNum(long mainNum) {
		this.mainNum = mainNum;
	}
	public String getMainName() {
		return mainName;
	}
	public void setMainName(String mainName) {
		this.mainName = mainName;
	}
	public long getTagNum() {
		return tagNum;
	}
	public void setTagNum(long tagNum) {
		this.tagNum = tagNum;
	}
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
}
