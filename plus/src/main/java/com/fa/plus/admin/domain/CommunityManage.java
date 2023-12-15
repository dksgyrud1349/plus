package com.fa.plus.admin.domain;

public class CommunityManage {
	private long num;  // 게시물 번호
	private String subject;  // 제목
	private String content;  // 내용
	private int hitCount;  // 조회수
	private String regDate;  // 등록일
	private String userId;  // 커뮤니티 작성자 아이디
	private String userName;
	
	private int replyCount;

	// 댓글
	private long replyNum;  // 댓글 번호
	private String reContent;  // 내용
	private String reRegDate;  // 등록일
	private String showReply;  // 댓글 숨기기
	private String saveFilename;
	
	// 댓글-좋아요
	private int bReplyLike;  // 좋아요 구분

	public String getSaveFilename() {
		return saveFilename;
	}

	public void setSaveFilename(String saveFilename) {
		this.saveFilename = saveFilename;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public long getNum() {
		return num;
	}

	public void setNum(long num) {
		this.num = num;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHitCount() {
		return hitCount;
	}

	public void setHitCount(int hitCount) {
		this.hitCount = hitCount;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public long getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(long replyNum) {
		this.replyNum = replyNum;
	}

	public String getReContent() {
		return reContent;
	}

	public void setReContent(String reContent) {
		this.reContent = reContent;
	}

	public String getReRegDate() {
		return reRegDate;
	}

	public void setReRegDate(String reRegDate) {
		this.reRegDate = reRegDate;
	}

	public String getShowReply() {
		return showReply;
	}

	public void setShowReply(String showReply) {
		this.showReply = showReply;
	}

	public int getbReplyLike() {
		return bReplyLike;
	}

	public void setbReplyLike(int bReplyLike) {
		this.bReplyLike = bReplyLike;
	}
}
