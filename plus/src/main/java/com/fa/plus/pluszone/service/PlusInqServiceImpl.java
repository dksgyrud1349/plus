package com.fa.plus.pluszone.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.pluszone.domain.PlusInq;
import com.fa.plus.pluszone.mapper.PlusInqMapper;

@Service
public class PlusInqServiceImpl implements PlusInqService{

	@Autowired
	private PlusInqMapper mapper;
	
	@Override
	public List<PlusInq> inqList(Map<String, Object> map) {
		List<PlusInq> list = null;
		try {
			list = mapper.inqList(map);
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
	public PlusInq findByNo(long inquiryNum) {
		PlusInq dto = null;
		try {
			dto = mapper.findByNo(inquiryNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public PlusInq findByYes(long inquiryNum) {
		PlusInq dto = null;
		try {
			dto = mapper.findByYes(inquiryNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void insertAnswer(Map<String, Object> map) throws Exception {
		try {
			mapper.insertAnswer(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateReInquiryNum(Map<String, Object> map) throws Exception {
		try {
			mapper.updateReInquiryNum(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateAnswer(Map<String, Object> map) throws Exception {
		try {
			mapper.updateAnswer(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteAnswer(long inquiryNum) throws Exception {
		try {
			mapper.deleteAnswer(inquiryNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int allInquiry(long memberIdx) {
		int dataCount = 0;
		try {
			dataCount = mapper.allInquiry(memberIdx);
		} catch (Exception e) {
		}
		return dataCount;
	}

	@Override
	public void deleteQuestion(long inquiryNum) throws Exception {
		try {
			mapper.deleteQuestion(inquiryNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
