package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.CommunityManage;

@Mapper
public interface CommunityManageMapper {
	public int dataCount(Map<String, Object> map);
	public List<CommunityManage> communityList(Map<String, Object> map);
	public void deleteCommunity(long num) throws SQLException;
	
	public CommunityManage findById(long num);
	public CommunityManage findByPrev(Map<String, Object> map);
	public CommunityManage findByNext(Map<String, Object> map);

	public int communityLikeCount(long num);
	
	public int replyCount(Map<String, Object> map);
	public List<ReplyManage> listReply(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws SQLException;
	
	public Map<String, Object> replyLikeCount(Map<String, Object> map);
	
}
