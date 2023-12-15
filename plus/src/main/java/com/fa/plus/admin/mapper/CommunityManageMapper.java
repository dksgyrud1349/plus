package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.CommunityManage;

@Mapper
public interface CommunityManageMapper {
	public List<CommunityManage> communityList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public void deleteCommunity(long num) throws SQLException;
	public int replyCount(Map<String, Object> map);
	public CommunityManage findById(long num);
}
