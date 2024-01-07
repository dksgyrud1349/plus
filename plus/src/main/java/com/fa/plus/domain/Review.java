package com.fa.plus.domain;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Review {
	private long reviewNum;
	private String reviewSubject;
	private String reviewContent;
	private String reviewDate;
	private int reviewScore;
	private String replyContent;
	private String replyDate;
	private int showReview;
	private boolean deletePermit;
	
	private long memberIdx;
	private long orderNum;
	private long classNum;
	private String className;
	private String userName;
	private String classDate;
	private long photoNum;
	private String fileName;
	
	private List<MultipartFile> selectFile;

	private String[] listFilename;

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

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}

	public int getShowReview() {
		return showReview;
	}

	public void setShowReview(int showReview) {
		this.showReview = showReview;
	}
	
	public boolean isDeletePermit() {
		return deletePermit;
	}

	public void setDeletePermit(boolean deletePermit) {
		this.deletePermit = deletePermit;
	}

	public long getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(long memberIdx) {
		this.memberIdx = memberIdx;
	}

	public long getOrderNum() {
		return orderNum;
	}

	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getClassDate() {
		return classDate;
	}

	public void setClassDate(String classDate) {
		this.classDate = classDate;
	}

	public long getPhotoNum() {
		return photoNum;
	}

	public void setPhotoNum(long photoNum) {
		this.photoNum = photoNum;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public List<MultipartFile> getSelectFile() {
		return selectFile;
	}

	public void setSelectFile(List<MultipartFile> selectFile) {
		this.selectFile = selectFile;
	}

	public String[] getListFilename() {
		return listFilename;
	}

	public void setListFilename(String[] listFilename) {
		this.listFilename = listFilename;
	}
	
	
}
