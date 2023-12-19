package com.fa.plus.pluszone.service;

import java.util.List;

import com.fa.plus.pluszone.domain.PluszoneAnswer;
import com.fa.plus.pluszone.domain.PluszoneQuestion;

public interface PluszoneQuestionService {
	public void insertAnswer(PluszoneAnswer dto) throws Exception;
	
	public List<PluszoneQuestion> listQuesion();
	public PluszoneAnswer listAnswer(String userId);
}
