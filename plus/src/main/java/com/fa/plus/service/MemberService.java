package com.fa.plus.service;

import java.util.Map;

import com.fa.plus.domain.Member;

public interface MemberService {
	
	public void insertMember(Member dto) throws Exception;	
	
	public void updateMembership(Map<String, Object> map) throws Exception;
	public void updateLastLogin(String userId) throws Exception;
	public void updateMember(Member dto) throws Exception;
	
	public Member findById(String userId);
	public Member findByMemberIdx(long memberIdx);
		
	public void generatePwd(Member dto) throws Exception;
	public boolean findByEmailId(String email);
	
	public boolean isPasswordCheck(String userId, String userPwd);
	public void updatePwd(Member dto) throws Exception;
	public int checkFailureCount(String userId);
	public void updateFailureCount(String userId) throws Exception;
	public void updateFailureCountReset(String userId) throws Exception;
	public void updateMemberEnabled(Map<String, Object> map) throws Exception;
	public void insertMemberState(Member dto) throws Exception;		
	
	public void updateMemberDropout(Map<String, Object> map) throws Exception;
}
