package com.fa.plus.chatting.mongodb;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Persistent;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Document(collection = "userRoom")
public class UserRoom {
	@Id
	private String roomIdx;	// 룸번호(회원번호)
	private String userId;
	private String userName;
	private int question;  // 문의 존재 유무(1:문의존재, 0:답변완료)
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private Date lastDate; // 마지막으로 메시지를 보낸 날짜
	
	@Persistent
	private String content;
	@Persistent
	private String date;
	
	public String getRoomIdx() {
		return roomIdx;
	}
	public void setRoomIdx(String roomIdx) {
		this.roomIdx = roomIdx;
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
	public int getQuestion() {
		return question;
	}
	public void setQuestion(int question) {
		this.question = question;
	}
	public Date getLastDate() {
		return lastDate;
	}
	public void setLastDate(Date lastDate) {
		this.lastDate = lastDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
