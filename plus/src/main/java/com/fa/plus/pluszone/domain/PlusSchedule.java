package com.fa.plus.pluszone.domain;

public class PlusSchedule {
	private long sNum;
	private String subject;
	private String sContent;
	private String sDay;
	private String eDay;
	private String sTime;
	private String eTime;
	private String sRegDate;
	private String color;
	private String allDay;
	
	private String userId; 
	private String userName;
	
	private Long cNum;
	private String cName;
	
	private long id;
	private String title;
	private boolean all_Day;
	private String start;
	private String end;
	
	public long getsNum() {
		return sNum;
	}
	public void setsNum(long sNum) {
		this.sNum = sNum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getsContent() {
		return sContent;
	}
	public void setsContent(String sContent) {
		this.sContent = sContent;
	}
	public String getsDay() {
		return sDay;
	}
	public void setsDay(String sDay) {
		this.sDay = sDay;
	}
	public String geteDay() {
		return eDay;
	}
	public void seteDay(String eDay) {
		this.eDay = eDay;
	}
	public String getsTime() {
		return sTime;
	}
	public void setsTime(String sTime) {
		this.sTime = sTime;
	}
	public String geteTime() {
		return eTime;
	}
	public void seteTime(String eTime) {
		this.eTime = eTime;
	}
	public String getsRegDate() {
		return sRegDate;
	}
	public void setsRegDate(String sRegDate) {
		this.sRegDate = sRegDate;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
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
	
	public Long getcNum() {
		return cNum;
	}
	public void setcNum(Long cNum) {
		this.cNum = cNum;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAllDay() {
		return allDay;
	}
	public void setAllDay(String allDay) {
		this.allDay = allDay;
	}
	public boolean isAll_Day() {
		return all_Day;
	}
	public void setAll_Day(boolean all_Day) {
		this.all_Day = all_Day;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	public String getEnd() {
		return end;
	}
	public void setEnd(String end) {
		this.end = end;
	}
	
}
