package com.fa.plus.admin.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.LessonManage;

public interface LessonManageService {
	public List<LessonManage> lessonList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public LessonManage findById(long classNum);
	public void updateApproval(Map<String, Object> map) throws SQLException;
}
