package com.fa.plus.domain;

public class Lesson {
	private long classNum;  // 클래스 번호
	private String className;  // 클래스명
	private int price;  // 가격
	private String content;  // 클래스 설명
	private String firstPhoto;  // 대표사진
	private int special;  // 상품구분
	private String startDate;  // 시작일자
	private String endDate;  // 종료일자
	private String regDate;  // 등록일자
	private String zip;  // 우편번호
	private String addr1;  // 기본주소
	private String addr2;  // 상세주소
	private int showClass;  // 공개여부
	private int mileage;  // 적립금
	
	private int tagNum;  // 해쉬태그번호
	private int subNum;  // 서브카테고리 번호
	private int memberIdx;  // 회원번호_플러스
	private int approvalNum;  // 승인번호
	
	private String nickName;  // 플러스의 닉네임
	
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFirstPhoto() {
		return firstPhoto;
	}
	public void setFirstPhoto(String firstPhoto) {
		this.firstPhoto = firstPhoto;
	}
	public int getSpecial() {
		return special;
	}
	public void setSpecial(int special) {
		this.special = special;
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
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
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
	public int getShowClass() {
		return showClass;
	}
	public void setShowClass(int showClass) {
		this.showClass = showClass;
	}
	public int getMileage() {
		return mileage;
	}
	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	public int getTagNum() {
		return tagNum;
	}
	public void setTagNum(int tagNum) {
		this.tagNum = tagNum;
	}
	public int getSubNum() {
		return subNum;
	}
	public void setSubNum(int subNum) {
		this.subNum = subNum;
	}
	public int getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}
	public int getApprovalNum() {
		return approvalNum;
	}
	public void setApprovalNum(int approvalNum) {
		this.approvalNum = approvalNum;
	}
}
