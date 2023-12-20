package com.fa.plus.pluszone.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.pluszone.domain.PluszoneAnswer;
import com.fa.plus.pluszone.domain.PluszoneQuestion;

@Mapper
public interface PluszoneQuestionMapper {
	public void insertAnswer(PluszoneAnswer dto) throws SQLException;
	
	public List<PluszoneQuestion> QSubject();
	public List<PluszoneQuestion> listQuestion();
	public PluszoneAnswer listAnswer(String userId);
}
