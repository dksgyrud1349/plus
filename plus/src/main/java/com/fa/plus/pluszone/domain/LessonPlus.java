package com.fa.plus.pluszone.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class LessonPlus {
	// lesson 테이블
	private long classNum;  // 클래스 번호
	private String className;  // 클래스명
	private int price;  // 가격
	private String content;  // 클래스 설명
	private int special;  // 상품구분(일반(0), 할인(1))
	private String startDate;  // 시작일자
	private String endDate;  // 종료일자
	private String regDate;  // 등록일자
	private String userName;
	
	private int classTime;  // 수업시간
	private String classDay;  // 수업 시간을 설정할 날짜
	private String startTime1;  // 시간
	private String startTime2;  // 시간
	private String startTime3;  // 시간
	private String startTime4;  // 시간     classDate = classDay + startTime1
	
	private String classDate;  // 수업날짜
	
	private String zip;  // 우편번호
	private String addr1;  // 기본주소
	private String addr2;  // 상세주소
	private int showClass;  // 공개여부(공개(0), 비공개(1))
	private int mileage;  // 클래스 적립금
	private long tagNum;  // 해쉬태그
	private String tagName;  // 해쉬태그 이름
	private long subNum;  // 서브카테고리
	private String subName;  // 서브카테고리 이름
	private long mainNum;  // 메인카테고리
	private String mainName;  // 메인카테고리 이름
	private long memberIdx;  // 회원번호_플러스

	// lessonDetail 테이블
	private long detailNum;  // 클래스 상세번호
	
	private int count;  // 최대인원수
	
	private String dContent;  // 상세설명
	
	// lessonPhoto 테이블
	private long photoNum;  // 사진번호
	private String photoName;  // 사진이름
	private List<MultipartFile> photos;
	
	private MultipartFile firstPhotoFile;  // 대표사진
	private String firstPhoto;  // 대표사진
	
	private long approvalNum;
	private String memo;
	private int approvalCode;
	private String userId;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public long getApprovalNum() {
		return approvalNum;
	}
	public void setApprovalNum(long approvalNum) {
		this.approvalNum = approvalNum;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getApprovalCode() {
		return approvalCode;
	}
	public void setApprovalCode(int approvalCode) {
		this.approvalCode = approvalCode;
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
	public int getClassTime() {
		return classTime;
	}
	public void setClassTime(int classTime) {
		this.classTime = classTime;
	}
	public String getClassDay() {
		return classDay;
	}
	public void setClassDay(String classDay) {
		this.classDay = classDay;
	}
	public String getStartTime1() {
		return startTime1;
	}
	public void setStartTime1(String startTime1) {
		this.startTime1 = startTime1;
	}
	public String getStartTime2() {
		return startTime2;
	}
	public void setStartTime2(String startTime2) {
		this.startTime2 = startTime2;
	}
	public String getStartTime3() {
		return startTime3;
	}
	public void setStartTime3(String startTime3) {
		this.startTime3 = startTime3;
	}
	public String getStartTime4() {
		return startTime4;
	}
	public void setStartTime4(String startTime4) {
		this.startTime4 = startTime4;
	}
	public String getClassDate() {
		return classDate;
	}
	public void setClassDate(String classDate) {
		this.classDate = classDate;
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
	public String getTagName() {
		return tagName;
	}
	public void setTagName(String tagName) {
		this.tagName = tagName;
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
	public String getdContent() {
		return dContent;
	}
	public void setdContent(String dContent) {
		this.dContent = dContent;
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
	public List<MultipartFile> getPhotos() {
		return photos;
	}
	public void setPhotos(List<MultipartFile> photos) {
		this.photos = photos;
	}
	public MultipartFile getFirstPhotoFile() {
		return firstPhotoFile;
	}
	public void setFirstPhotoFile(MultipartFile firstPhotoFile) {
		this.firstPhotoFile = firstPhotoFile;
	}
	public String getFirstPhoto() {
		return firstPhoto;
	}
	public void setFirstPhoto(String firstPhoto) {
		this.firstPhoto = firstPhoto;
	}
}
