package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.CommunityManage;
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
	
}
