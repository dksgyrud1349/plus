package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.CommunityManage;
import com.fa.plus.admin.domain.ReplyManage;
import com.fa.plus.admin.mapper.CommunityManageMapper;

@Service
public class CommunityManageServiceImpl implements CommunityManageService{

	@Autowired
	private CommunityManageMapper mapper;
	
	@Override
	public List<CommunityManage> communityList(Map<String, Object> map) {
		List<CommunityManage> list = null;
		try {
			list = mapper.communityList(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void deleteCommunity(long num) throws Exception {
		try {
			mapper.deleteCommunity(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		int result = 0;
		try {
			result = mapper.replyCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public CommunityManage findById(long num) {
		CommunityManage dto = null;
		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public CommunityManage findByPrev(Map<String, Object> map) {
		CommunityManage dto = null;
		
		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return dto;
	}

	@Override
	public CommunityManage findByNext(Map<String, Object> map) {
		CommunityManage dto = null;
		
		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return dto;
	}

	@Override
	public int communityLikeCount(long num) {
		int result = 0;
		
		try {
			result = mapper.communityLikeCount(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<ReplyManage> listReply(Map<String, Object> map) {
		List<ReplyManage> list = null;
		
		try {
			list = mapper.listReply(map);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return list;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteReply(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		Map<String, Object> countMap = null;
		
		try {
			countMap = mapper.replyLikeCount(countMap);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return countMap;
	}
	
}
