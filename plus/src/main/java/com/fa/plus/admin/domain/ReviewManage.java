package com.fa.plus.admin.domain;

public class ReviewManage {

	private long reviewNum;				// 리뷰 게시판 번호
	private String reviewSubject;		// 리뷰 제목
	private String reviewContent;		// 리뷰 내용
	private String reviewDate;			// 리뷰 날짜
	private int reviewScore;			// 리뷰 별점
	private long memberIdx;				// 회원번호
	private long photoNum;				// 사진 번호
	private String filename;			// 클라이언트가 올린 사진 이름
	private int showReview;				// 리뷰 공개 여부
	private long orderNum;				// 주문번호
	private String userId;				// 회원ID
	private String userName;			// 회원이름
	private String className;			// 클래스 명
	private String cDate;				// 회원 수강날짜
	
	public long getReviewNum() {
		return reviewNum;
	}
	public void setReviewNum(long reviewNum) {
		this.reviewNum = reviewNum;
	}
	public String getReviewSubject() {
		return reviewSubject;
	}
	public void setReviewSubject(String reviewSubject) {
		this.reviewSubject = reviewSubject;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewDate() {
		return reviewDate;
	}
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	public int getReviewScore() {
		return reviewScore;
	}
	public void setReviewScore(int reviewScore) {
		this.reviewScore = reviewScore;
	}
	public long getMemberIdx() {
		return memberIdx;
	}
	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}
	public long getPhotoNum() {
		return photoNum;
	}
	public void setPhotoNum(long photoNum) {
		this.photoNum = photoNum;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getShowReview() {
		return showReview;
	}
	public void setShowReview(int showReview) {
		this.showReview = showReview;
	}
	public long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
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
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getcDate() {
		return cDate;
	}
	public void setcDate(String cDate) {
		this.cDate = cDate;
	}
}
