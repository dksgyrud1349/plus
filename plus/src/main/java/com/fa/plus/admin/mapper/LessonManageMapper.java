package com.fa.plus.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.LessonManage;

@Mapper
public interface LessonManageMapper {
	
	public List<LessonManage> lessonList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public LessonManage findById(long classNum);
	
	// 승인 상태 바꾸기
	public void updateApproval(Map<String, Object> map);
}
