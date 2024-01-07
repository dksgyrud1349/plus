package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.ClassInq;

@Mapper
public interface ClassInqMapper {
	// 사용자가 문의 등록
	public void insertInq(ClassInq dto) throws SQLException;
	
	// 클래스 번호로 클래스 이름 찾기
	public ClassInq findByClassName(long classNum);
	
	// 마이페이지에서 자신이 등록한 문의내역 리스트
	public List<ClassInq> myInqList(Map<String, Object> map);
	
	// 데이터 개수
	public int dataCount(Map<String, Object> map);
	
	// article에서 문의글
	public ClassInq findByNo(long inquiryNum);
	
	// article에서 답변글
	public ClassInq findByYes(long inquiryNum);
	
	// 문의글 수정
	public void updateInq(Map<String, Object> map) throws SQLException;
}
