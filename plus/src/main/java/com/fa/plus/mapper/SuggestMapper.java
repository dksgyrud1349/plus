package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Suggest;

@Mapper
public interface SuggestMapper {
	
	public void insertSuggest(Suggest dto) throws SQLException;
	public void updateSuggest(Suggest dto) throws SQLException;
	public void deleteSuggest(long sugNum) throws SQLException;;
	
	public int dataCount(Map <String,Object>map);
	public Suggest findById(long num);
	
	public List<Suggest> listSuggest(Map<String, Object>map);
	//public List<Suggest> listTitle(String userName);
	
}
