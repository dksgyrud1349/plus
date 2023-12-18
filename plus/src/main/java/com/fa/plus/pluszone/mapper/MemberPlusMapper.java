package com.fa.plus.pluszone.mapper;

import java.sql.SQLException;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.pluszone.domain.MemberPlus;

@Mapper
public interface MemberPlusMapper {
	public MemberPlus loginPlusMember(String userId);
	public void updateLastLogin(String userId) throws SQLException;
	
	public long memberSeq();
	public void insertPlus(long seq) throws SQLException;
	public void insertPlus12(MemberPlus dto) throws SQLException;
	
	public void updatePlusEnabled(Map<String, Object> map) throws SQLException;
	public void updatePlus1(MemberPlus dto) throws SQLException;
	public void updatePlus2(MemberPlus dto) throws SQLException;
	
	public MemberPlus findById(String userId);
	public MemberPlus findByMemberIdx(long memberIdx);
	
	public int checkFailureCount(String userId);
	public void updateFailureCountReset(String userId) throws SQLException;
	public void updateFailureCount(String userId) throws SQLException;
	public void insertPlusState(MemberPlus dto) throws SQLException;
	
	public void insertAuthority(MemberPlus dto) throws SQLException;
	public void updateAuthority(MemberPlus dto) throws SQLException;
	
}
