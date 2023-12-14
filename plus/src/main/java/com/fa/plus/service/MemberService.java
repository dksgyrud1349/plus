package com.fa.plus.service;


import com.fa.plus.domain.Member;

public interface MemberService {
	
	public void insertMember(Member dto) throws Exception;	
	
	public Member findById(String userId);
	public Member findByMemberIdx(long memberIdx);
	
	
	
}
