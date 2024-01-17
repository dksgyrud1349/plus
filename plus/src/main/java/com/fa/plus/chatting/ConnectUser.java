package com.fa.plus.chatting;

import javax.websocket.Session;

// 접속한 유저에 대한 정보
public class ConnectUser {
	private String uidx;
	private String userId;
	private String userName;
	private String aidx;  // 상담원 아이디
	private Session session;
	
	public String getUidx() {
		return uidx;
	}
	public void setUidx(String uidx) {
		this.uidx = uidx;
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
	public String getAidx() {
		return aidx;
	}
	public void setAidx(String aidx) {
		this.aidx = aidx;
	}
	public Session getSession() {
		return session;
	}
	public void setSession(Session session) {
		this.session = session;
	}
}
