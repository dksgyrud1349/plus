package com.fa.plus.pluszone.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.pluszone.domain.LessonPlus;

public interface LessonPlusService {
	public void insertLesson(LessonPlus dto, String pathname) throws Exception;
	
	public int dataCount(Map<String, Object> map);
	public List<LessonPlus> myLessonList(Map<String, Object> map);

	public LessonPlus findById(long classNum);
	public List<LessonPlus> findByDetail(long classNum);
	public LessonPlus findBySubCategory(long subNum);
	public List<LessonPlus> listLessonPhoto(long classNum);
	
	public List<LessonPlus> listMainCategory();
	public List<LessonPlus> listSubCategory(long mainNum);
	public List<LessonPlus> listHashTag();
	
	public void updateLesson(LessonPlus dto, String pathname) throws Exception;
	public void updateLessonDetail(Map<String, Object> map) throws Exception;
	
	public void deleteLesson(long classNum) throws Exception;
	public void deleteLessonDetail(long detailNum) throws Exception;
	public void deleteLessonPhoto(long photoNum, String pathname) throws Exception;
	
}
