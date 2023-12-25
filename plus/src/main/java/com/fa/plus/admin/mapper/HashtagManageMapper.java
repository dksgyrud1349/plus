package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.HashtagManage;

@Mapper
public interface HashtagManageMapper {
	public void insertHashtag(HashtagManage dto) throws SQLException;
	public void deleteHashtag(long tagNum) throws SQLException;
	
	public int dataCount();
	public List<HashtagManage> listHashtag();

}
