package com.fa.plus.pluszone.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.pluszone.domain.PluszoneAnswer;
import com.fa.plus.pluszone.domain.PluszoneQuestion;
import com.fa.plus.pluszone.mapper.PluszoneQuestionMapper;

@Service
public class PluszoneQuestionServiceImpl implements PluszoneQuestionService {

	@Autowired
	PluszoneQuestionMapper mapper;
	
	@Override
	public void insertAnswer(PluszoneAnswer dto) throws Exception {
		try {
			mapper.insertAnswer(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<PluszoneQuestion> listQuestion() {
		List<PluszoneQuestion> list = null;
		try {
			list = mapper.listQuestion();
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public PluszoneAnswer listAnswer(String userId) {
		PluszoneAnswer dto = null;
		try {
			dto = mapper.listAnswer(userId);
		} catch (Exception e) {
		}
		return dto;
	}

}
