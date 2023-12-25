package com.fa.plus.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.HashtagManage;
import com.fa.plus.admin.mapper.HashtagManageMapper;

@Service
public class HashtagManageServiceImpl implements HashtagManageService {

	@Autowired
	private HashtagManageMapper mapper;
	
	@Override
	public void insertHashtag(HashtagManage dto) throws Exception {
		try {
			mapper.insertHashtag(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteHashtag(long tagNum) throws Exception {
		try {
			mapper.deleteHashtag(tagNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int dataCount() {
		int result = 0;
		try {
			result = mapper.dataCount();
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<HashtagManage> listHashtag() {
		List<HashtagManage> list = null;
		try {
			list = mapper.listHashtag();
		} catch (Exception e) {
		}
		
		return list;
	}

}
