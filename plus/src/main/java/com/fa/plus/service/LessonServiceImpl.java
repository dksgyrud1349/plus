package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.common.FileManager;
import com.fa.plus.domain.Lesson;
import com.fa.plus.mapper.LessonMapper;

@Service
public class LessonServiceImpl implements LessonService{

	@Autowired
	private LessonMapper mapper;
	
	@Autowired
	private FileManager fileManager;
	
	@Override
	public List<Lesson> allLessonList(Map<String, Object> map) {
		List<Lesson> list = null;
		try {
			list = mapper.allLessonList(map);
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

}
