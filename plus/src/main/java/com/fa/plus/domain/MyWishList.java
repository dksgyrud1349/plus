package com.fa.plus.domain;

public class MyWishList {
	private long classNum;  // 클래스 번호
	private String className;  // 클래스 이름
	private int price;  // 가격
	private String firstPhoto;  // 대표사진
	private String addr1;  // 기본주소
	private String nickName;  // 플러스 별명
	private String startDate;  // 시작일
	private String endDate;  // 종료일
	
	private String wishDate;  // 위시리스트 등록일
	private String userId;
	
	private int lessonLikeCount;  // 좋아요 개수
	private boolean userLessonLiked;
	
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
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
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
	public String getWishDate() {
		return wishDate;
	}
	public void setWishDate(String wishDate) {
		this.wishDate = wishDate;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getLessonLikeCount() {
		return lessonLikeCount;
	}
	public void setLessonLikeCount(int lessonLikeCount) {
		this.lessonLikeCount = lessonLikeCount;
	}
	public boolean isUserLessonLiked() {
		return userLessonLiked;
	}
	public void setUserLessonLiked(boolean userLessonLiked) {
		this.userLessonLiked = userLessonLiked;
	}
}
