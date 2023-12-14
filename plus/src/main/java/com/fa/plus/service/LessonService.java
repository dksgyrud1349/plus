package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.Lesson;

public interface LessonService {
	public List<Lesson> allLessonList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
}
