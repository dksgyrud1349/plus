package com.fa.plus.pluszone.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.pluszone.domain.PlusInq;

@Mapper
public interface PlusInqMapper {
	public List<PlusInq> inqList(Map<String, Object> map);
	public int dataCount(Map<String, Object> map);
	
	// 답변대기
	public PlusInq findByNo(long inquiryNum);
	
	// 답변완료
	public PlusInq findByYes(long inquiryNum);
	
	// 답변입력
	public void insertAnswer(Map<String, Object> map) throws SQLException;
	
	// 답변 입력 후 답변 여부 바꾸기
	public void updateReInquiryNum(Map<String, Object> map) throws SQLException;
	
	// 답변 수정
	public void updateAnswer(Map<String, Object> map) throws SQLException;
	
	// 답변 삭제
	public void deleteAnswer(long inquiryNum) throws SQLException;
	
	// 문의 전체 개수
	public int allInquiry(long memberIdx);
}
