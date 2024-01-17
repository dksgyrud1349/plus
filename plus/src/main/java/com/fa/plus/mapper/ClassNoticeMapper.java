package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.ClassNotice;

@Mapper
public interface ClassNoticeMapper {
	public List<ClassNotice> notices(long classNum);
	public List<ClassNotice> noticeList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public ClassNotice findById(long classNum);
	
	public void updateHitCount(long num) throws SQLException;
	
	public ClassNotice findByPrev(Map<String, Object> map);
	public ClassNotice findByNext(Map<String, Object> map);
	
}
