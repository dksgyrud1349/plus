package com.fa.plus.mapper;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Member;

@Mapper
public interface MemberMapper {
	public Member loginMember(String userId);
	public void updateLastLogin(String userId) throws SQLException;
	
	public long memberSeq();
	public void insertMember(long seq) throws SQLException;
	public void insertMember1(Member dto) throws SQLException;
	public void insertMember2(Member dto) throws SQLException;
	public void insertMember12(Member dto) throws SQLException;
	
	public Member findById(String userId);
	public Member findByMemberIdx(long memberIdx);
	
	
	
	public void insertAuthority(Member dto) throws SQLException;
	public void updateAuthority(Member dto) throws SQLException;
}
