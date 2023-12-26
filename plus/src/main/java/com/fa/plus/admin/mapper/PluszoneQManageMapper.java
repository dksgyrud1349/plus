package com.fa.plus.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.PluszoneQuestionManage;

@Mapper
public interface PluszoneQManageMapper {
	public List<PluszoneQuestionManage> QSubject();
	public List<PluszoneQuestionManage> listQuestion();
}
