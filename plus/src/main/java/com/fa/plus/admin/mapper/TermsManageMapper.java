package com.fa.plus.admin.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import com.fa.plus.admin.domain.TermsManage;

@Mapper
public interface TermsManageMapper {
	public void insertTerms(TermsManage dto) throws SQLException;
	public void updateTerms(TermsManage dto) throws SQLException;
	public void deleteTerms(long num) throws SQLException;	
	
	public List<TermsManage> listTerms(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public TermsManage findById(long num);
	public TermsManage findByPrev(Map<String, Object> map);
	public TermsManage findByNext(Map<String, Object> map);
}
