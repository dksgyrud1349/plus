package com.fa.plus.chatting.mongodb;

import java.util.Date;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

@Document(collection = "userMessage")
public class UserMessage {
	@Id
	private ObjectId msgId;		// 채팅메시지아이디
	private String fromIdx;		// 보낸사람
	private String fromName;	// 보낸사람이름
	private int classify;		// 구분(1:회원질문, 2:관리자답변, 3:관리자공지사항)
	private	String roomIdx;		// 룸아이디
	private String toIdx;		// 받는사람
	private String toName;		// 받는사람이름
	private String content;
	private String readIdx;		// 메시지를 읽은 사람
	
	@DateTimeFormat(iso = ISO.DATE_TIME)
	private Date sendDate;		// 보낸날짜

	// 출력용
	@Transient
	private String date;		// 보낸날짜
	@Transient
	private String dateWeek;	// 보낸날짜 및 요일
	@Transient
	private String time;		// 보낸시간
	
	public ObjectId getMsgId() {
		return msgId;
	}
	public void setMsgId(ObjectId msgId) {
		this.msgId = msgId;
	}
	public String getFromIdx() {
		return fromIdx;
	}
	public void setFromIdx(String fromIdx) {
		this.fromIdx = fromIdx;
	}
	public String getFromName() {
		return fromName;
	}
	public void setFromName(String fromName) {
		this.fromName = fromName;
	}
	public int getClassify() {
		return classify;
	}
	public void setClassify(int classify) {
		this.classify = classify;
	}
	public String getRoomIdx() {
		return roomIdx;
	}
	public void setRoomIdx(String roomIdx) {
		this.roomIdx = roomIdx;
	}
	public String getToIdx() {
		return toIdx;
	}
	public void setToIdx(String toIdx) {
		this.toIdx = toIdx;
	}
	public String getToName() {
		return toName;
	}
	public void setToName(String toName) {
		this.toName = toName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReadIdx() {
		return readIdx;
	}
	public void setReadIdx(String readIdx) {
		this.readIdx = readIdx;
	}
	public Date getSendDate() {
		return sendDate;
	}
	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDateWeek() {
		return dateWeek;
	}
	public void setDateWeek(String dateWeek) {
		this.dateWeek = dateWeek;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}
