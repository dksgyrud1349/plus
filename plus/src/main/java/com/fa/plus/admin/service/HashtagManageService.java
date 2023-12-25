package com.fa.plus.admin.service;

import java.util.List;

import com.fa.plus.admin.domain.HashtagManage;

public interface HashtagManageService {
	public void insertHashtag(HashtagManage dto) throws Exception;
	public void deleteHashtag(long tagNum) throws Exception;
	
	public int dataCount();
	public List<HashtagManage> listHashtag();
}
