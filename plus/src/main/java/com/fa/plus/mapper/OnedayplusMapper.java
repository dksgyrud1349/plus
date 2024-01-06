package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.PlusAns;
import com.fa.plus.domain.PlusQ;

@Mapper
public interface OnedayplusMapper {
	public void insertAnswer(PlusAns dto) throws SQLException;
	
	public List<PlusQ> QSubject();
	public List<PlusQ> listQuestion();
	public List<PlusAns> listAnswer(String userId);
	public void deleteAnswer(String userId);
}
