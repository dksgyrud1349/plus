package com.fa.plus.pluszone.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.pluszone.domain.PluszoneAnswer;
import com.fa.plus.pluszone.domain.PluszoneQuesion;

@Mapper
public interface PluszoneQuestionMapper {
	public void insertAnswer(PluszoneAnswer dto) throws SQLException;
	
	public List<PluszoneQuesion> listQuesion();
	public List<PluszoneAnswer> listAnswer(Map<String, Object> map);
}
