package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.CommunityManage;
import com.fa.plus.admin.domain.ReplyManage;

public interface CommunityManageService {
	public int dataCount(Map<String, Object> map);
	public List<CommunityManage> communityList(Map<String, Object> map);
	public void deleteCommunity(long num) throws Exception;
	public CommunityManage findById(long num);
	
	public CommunityManage findByPrev(Map<String, Object> map);
	public CommunityManage findByNext(Map<String, Object> map);

	public int replyCount(Map<String, Object> map);
	public int communityLikeCount(long num);
	public List<ReplyManage> listReply(Map<String, Object> map);
	public void deleteReply(Map<String, Object> map) throws Exception;
	public Map<String, Object> replyLikeCount(Map<String, Object> map);
}
