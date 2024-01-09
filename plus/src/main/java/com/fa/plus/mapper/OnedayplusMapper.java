package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Lesson;
import com.fa.plus.domain.PlusAns;
import com.fa.plus.domain.PlusQ;

@Mapper
public interface OnedayplusMapper {
	public void insertAnswer(PlusAns dto) throws SQLException;
	
	public List<PlusQ> QSubject();
	public List<PlusQ> listQuestion();
	public List<PlusAns> listAnswer(String userId);
	public void deleteAnswer(String userId);
	
	public List<Lesson> resultClass(Map<String,Object> map); 
	
	public String resultPurpose(String userId); 
	public String resultCategory(String userId); 
	public String resultLocation(String userId);
	public long resultPrice(String userId);
	
	public int answerCount(String userId);
	public int resultCount(String userId);
	
}
