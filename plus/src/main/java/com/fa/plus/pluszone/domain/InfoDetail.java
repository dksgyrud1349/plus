package com.fa.plus.pluszone.domain;

import org.springframework.web.multipart.MultipartFile;

public class InfoDetail {
	private String userId;					// 회원ID
	private String content;					// 소개
	private String nickName;				// 닉네임
	
	private MultipartFile photoFile;		// 대표사진
	private String photo;					// 대표사진
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public MultipartFile getPhotoFile() {
		return photoFile;
	}
	public void setPhotoFile(MultipartFile photoFile) {
		this.photoFile = photoFile;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
}
