package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.Answer;
import com.fa.plus.admin.domain.MemberManage;
import com.fa.plus.admin.domain.Qna;
import com.fa.plus.admin.mapper.PlusManageMapper;

@Service
public class PlusManageServiceImpl implements PlusManageService{

	@Autowired
	private PlusManageMapper mapper;
	
	@Override
	public List<MemberManage> plusList(Map<String, Object> map) {
		List<MemberManage> list = null;
		try {
			list = mapper.plusList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<Qna> findByQna(String userId) {
		List<Qna> list = null;
		try {
			list = mapper.findByQna(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Answer> answerChart() {
		List<Answer> list = null;
		try {
			list = mapper.answerChart();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Answer> answerChart1() {
		List<Answer> list = null;
		try {
			list = mapper.answerChart1();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Answer> answerChart2() {
		List<Answer> list = null;
		try {
			list = mapper.answerChart2();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Answer> answerChart3() {
		List<Answer> list = null;
		try {
			list = mapper.answerChart3();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Answer> answerChart4() {
		List<Answer> list = null;
		try {
			list = mapper.answerChart4();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
