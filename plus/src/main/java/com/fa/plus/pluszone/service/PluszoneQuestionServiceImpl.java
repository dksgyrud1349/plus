package com.fa.plus.pluszone.service;

import java.util.List;
import java.util.Map;

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
	public List<PluszoneQuestion> listQuesion() {
		List<PluszoneQuestion> list = null;
		try {
			list = mapper.listQuesion();
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public List<PluszoneAnswer> listAnswer(Map<String, Object> map) {
		List<PluszoneAnswer> list = null;
		try {
			list = mapper.listAnswer(map);
		} catch (Exception e) {
		}
		return list;
	}

}
