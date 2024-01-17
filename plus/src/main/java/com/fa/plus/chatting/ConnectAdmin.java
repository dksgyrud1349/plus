package com.fa.plus.chatting;

import javax.websocket.Session;

// 접속한 관리자에 대한 정보
public class ConnectAdmin {
	private String aidx;
	private String adminName;
	private String uidx;		// 상담하고 있는 유저
	private Session session;
	
	public String getAidx() {
		return aidx;
	}
	public void setAidx(String aidx) {
		this.aidx = aidx;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getUidx() {
		return uidx;
	}
	public void setUidx(String uidx) {
		this.uidx = uidx;
	}
	public Session getSession() {
		return session;
	}
	public void setSession(Session session) {
		this.session = session;
	}
}
