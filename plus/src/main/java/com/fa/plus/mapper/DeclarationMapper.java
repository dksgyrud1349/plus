package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Declaration;

@Mapper
public interface DeclarationMapper {
	
	// 클래스 신고자 정보 가져오기
	public Declaration findById(String userId);
	
	// 클래스 모든 목록 가져오기
	public List<Declaration> findByAllClass();
	
	// 선택한 클래스 번호 가져오기
	public long findByNum(String className);
	
	// 클래스 신고 등록
	public void insertDeclaration(Declaration dto) throws SQLException;
	
}
