package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.ClassNotice;
import com.fa.plus.mapper.ClassNoticeMapper;

@Service
public class ClassNoticeServiceImpl implements ClassNoticeService{
	
	@Autowired
	private ClassNoticeMapper mapper;
	
	@Override
	public List<ClassNotice> notices(long classNum) {
		List<ClassNotice> list = null;
		try {
			list = mapper.notices(classNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ClassNotice> noticeList(Map<String, Object> map) {
		List<ClassNotice> list = null;
		try {
			list = mapper.noticeList(map);
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
	public ClassNotice findById(long classNum) {
		ClassNotice dto = null;
		try {
			dto = mapper.findById(classNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			mapper.updateHitCount(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public ClassNotice findByPrev(Map<String, Object> map) {
		ClassNotice dto = null;
		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public ClassNotice findByNext(Map<String, Object> map) {
		ClassNotice dto = null;
		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
}
