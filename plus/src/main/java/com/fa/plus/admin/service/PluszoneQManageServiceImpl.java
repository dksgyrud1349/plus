package com.fa.plus.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.PluszoneQuestionManage;
import com.fa.plus.admin.mapper.PluszoneQManageMapper;

@Service
public class PluszoneQManageServiceImpl implements PluszoneQManageService {

	@Autowired
	private PluszoneQManageMapper mapper;
	
	@Override
	public List<PluszoneQuestionManage> QSubject() {
		List<PluszoneQuestionManage> list = null;
		try {
			mapper.QSubject();
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public List<PluszoneQuestionManage> listQuestion() {
		List<PluszoneQuestionManage> list = null;
		try {
			mapper.listQuestion();
		} catch (Exception e) {
		}
		return list;
	}

}
