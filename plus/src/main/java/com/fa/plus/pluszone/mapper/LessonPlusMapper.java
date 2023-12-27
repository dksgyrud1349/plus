package com.fa.plus.pluszone.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.pluszone.domain.LessonPlus;

@Mapper
public interface LessonPlusMapper {
	
	// 클래스 등록
	public long lessonSeq();//
	public void insertLesson(LessonPlus lesson) throws SQLException;//
	public void insertLessonPhoto(LessonPlus lesson) throws SQLException;//
	public void insertLessonDetail(LessonPlus lesson) throws SQLException;//
	
	public List<LessonPlus> listMainCategory();
	public List<LessonPlus> listSubCategory(long mainNum);
	public List<LessonPlus> listHashTag();
	
	// 클래스 리스트
	public List<LessonPlus> myLessonList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public void insertApproval(LessonPlus lesson) throws SQLException;
	
	public LessonPlus findById(long classNum);
	public LessonPlus findBySubCategory(long subNum);
	public List<LessonPlus> findByDetail(long classNum) throws SQLException;
	public List<LessonPlus> listLessonPhoto(long classNum);
	
	public void deleteLessonDetail(long classNum) throws SQLException;
	
	public void updateLesson(LessonPlus lesson) throws SQLException;
	
	// 클래스 삭제
	public void deleteLesson(long classNum) throws SQLException;
	public void deleteLessonPhoto(long photoNum) throws SQLException;
}
