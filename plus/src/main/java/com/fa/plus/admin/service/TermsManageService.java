package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.TermsManage;

public interface TermsManageService {
	public void insertTerms(TermsManage dto) throws Exception;
	public void updateTerms(TermsManage dto) throws Exception;
	public void deleteTerms(long num) throws Exception;
	
	public List<TermsManage> listTerms (Map<String, Object> map);
	public int dataCount (Map<String, Object> map);
	
	public TermsManage findById(long num);
	public TermsManage findByPrev(Map<String, Object> map);
	public TermsManage findByNext(Map<String, Object> map);

}
