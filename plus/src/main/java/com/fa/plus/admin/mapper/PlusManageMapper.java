package com.fa.plus.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.Answer;
import com.fa.plus.admin.domain.MemberManage;
import com.fa.plus.admin.domain.Qna;

@Mapper
public interface PlusManageMapper {
	public List<MemberManage> plusList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	public List<Qna> findByQna(String userId);
		// 질문지에 답을 한 사람의 아이디에 대한 Qna 리스트
	
	public List<Answer> answerChart();
	public List<Answer> answerChart1();
	public List<Answer> answerChart2();
	public List<Answer> answerChart3();
	public List<Answer> answerChart4();
}
