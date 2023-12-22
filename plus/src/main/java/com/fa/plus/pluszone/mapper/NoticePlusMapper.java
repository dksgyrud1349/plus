package com.fa.plus.pluszone.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.pluszone.domain.NoticePlus;
@Mapper
public interface NoticePlusMapper {
	public long noticePlusSeq();
	public void insertNotice(NoticePlus dto) throws SQLException;
	public void updateNotice(NoticePlus dto) throws SQLException;
	public void deleteNotice(long num) throws SQLException;
	
	public List<NoticePlus> listTitle(long memberIdx);
	
	public int dataCount(Map<String, Object> map);//페이지 개수
	public List<NoticePlus> listNoticeTop(Map<String, Object> map);
	public List<NoticePlus> listNotice(Map<String, Object> map);
	
	public NoticePlus findById(long num);//누가썼느냐
	public void updateHitCount(long num) throws Exception;	//조회수
	public NoticePlus findByPrev(Map<String, Object> map);
	public NoticePlus findByNext(Map<String, Object> map);
}
