package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.Lesson;
import com.fa.plus.domain.LessonDetail;

public interface LessonService {
	public List<Lesson> allLessonList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public List<Lesson> listMainCategory();
	public List<Lesson> listSubCategory(long mainNum);
	public List<Lesson> listLessonPhoto(long classNum);
	public Lesson findById(long classNum);
	
	public void insertLessonLike(Map<String, Object> map) throws Exception;
	public void deleteLessonLike(Map<String, Object> map) throws Exception;
	public int lessonLikeCount(long classNum);
	public boolean userLessonLiked(Map<String, Object> map);

	public List<LessonDetail> getLessonDtlDate(long classNum);				// 클래스 상세 페이지(수강 날짜)
	public List<LessonDetail> getLessonDtlTime(Map<String, Object> map);	// 클래스 상세 페이지(수강 시간)
	
	public List<Lesson> newClassList();
}
