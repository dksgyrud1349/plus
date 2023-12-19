package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.admin.domain.Answer;
import com.fa.plus.admin.domain.MemberManage;
import com.fa.plus.admin.domain.Qna;

public interface PlusManageService {
	public List<MemberManage> plusList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	public void updateMembership(Map<String, Object> map) throws Exception;
	
	public MemberManage findById(String userId);
	public MemberManage findIdx(String userId);
	public void updateFailureCountReset(String userId) throws Exception;
	public void updateMemberEnabled(Map<String, Object> map) throws Exception;
	public void insertMemberState(MemberManage dto) throws Exception;
	public List<MemberManage> listMemberState(String userId);
	public MemberManage findByState(String userId);
	
	public List<Qna> findByQna(String userId);
	public List<Answer> answerChart();
	public List<Answer> answerChart1();
	public List<Answer> answerChart2();
	public List<Answer> answerChart3();
	public List<Answer> answerChart4();
}
