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
	
	private long tagNum;  // 해쉬태그번호
	private long subNum;  // 서브카테고리 번호
	private String subName;  // 서브 카테고리 이름
	private long mainNum;  // 메인카테고리 번호
	private String mainName;  // 메인 카테고리 이름
	private long memberIdx;  // 회원번호_플러스
	private long approvalNum;  // 승인번호
	
	private String nickName;  // 플러스의 닉네임

	private long photoNum; // 사진 번호
	private String photoName; // 사진 이름
	
	private int lessonLikeCount;  // 좋아요 개수
	
	public int getLessonLikeCount() {
		return lessonLikeCount;
	}

	public void setLessonLikeCount(int lessonLikeCount) {
		this.lessonLikeCount = lessonLikeCount;
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

	public long getTagNum() {
		return tagNum;
	}

	public void setTagNum(long tagNum) {
		this.tagNum = tagNum;
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

	public long getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}

	public long getApprovalNum() {
		return approvalNum;
	}

	public void setApprovalNum(long approvalNum) {
		this.approvalNum = approvalNum;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public long getPhotoNum() {
		return photoNum;
	}

	public void setPhotoNum(long photoNum) {
		this.photoNum = photoNum;
	}

	public String getPhotoName() {
		return photoName;
	}

	public void setPhotoName(String photoName) {
		this.photoName = photoName;
	}
	
}
