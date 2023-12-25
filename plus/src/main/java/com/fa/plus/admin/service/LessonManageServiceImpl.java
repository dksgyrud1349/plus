package com.fa.plus.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.LessonManage;
import com.fa.plus.admin.mapper.LessonManageMapper;

@Service
public class LessonManageServiceImpl implements LessonManageService{

	@Autowired
	private LessonManageMapper mapper;
	
	@Override
	public List<LessonManage> lessonList(Map<String, Object> map) {
		List<LessonManage> list = null;
		try {
			list = mapper.lessonList(map);
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
	public LessonManage findById(long classNum) {
		LessonManage dto = null;
		try {
			dto = mapper.findById(classNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateApproval(Map<String, Object> map) throws SQLException {
		try {
			mapper.updateApproval(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}	
	}
}
