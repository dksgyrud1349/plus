package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.CommunityManage;

public interface CommunityManageService {
	public List<CommunityManage> communityList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public void deleteCommunity(long num) throws Exception;
	public int replyCount(Map<String, Object> map);
	public CommunityManage findById(long num);
}
