package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.MemberManage;
import com.fa.plus.admin.domain.PluszoneAnswerManage;

@Mapper
public interface PlusManageMapper {
	public List<MemberManage> plusList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public void updateMembership(Map<String, Object> map) throws SQLException;
	public void updateAuthority(MemberManage dto) throws SQLException;
	
	public MemberManage findById(String userId);
	public MemberManage findIdx(String userId);
	public void updateFailureCountReset(String userId) throws SQLException;
	public void updateMemberEnabled(Map<String, Object> map) throws SQLException;
	public void insertMemberState(MemberManage dto) throws SQLException;
	public List<MemberManage> listMemberState(String userId);
	public MemberManage findByState(String userId);

	public List<PluszoneAnswerManage> findByAnswer(String userId);
	public List<PluszoneAnswerManage> ageChart();
}
