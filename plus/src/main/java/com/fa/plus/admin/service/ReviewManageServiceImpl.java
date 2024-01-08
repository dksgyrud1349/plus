package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.ReviewManage;
import com.fa.plus.admin.mapper.ReviewManageMapper;

@Service
public class ReviewManageServiceImpl implements ReviewManageService{

	@Autowired
	private ReviewManageMapper mapper;
	
	@Override
	public int dataCount(Map<String, Object> map) {
		int dataCount = 0;
		try {
			dataCount = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataCount;
	}

	@Override
	public List<ReviewManage> listReview(Map<String, Object> map) {
		List<ReviewManage> list = null;
		try {
			list = mapper.listReview(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<ReviewManage> listHideReview(Map<String, Object> map) {
		List<ReviewManage> list = null;
		try {
			list = mapper.listHideReview(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public ReviewManage findByReview(long reviewNum) {
		ReviewManage dto = null;
		try {
			dto = mapper.findByReview(reviewNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void changeHideReview(long reviewNum) {
		try {
			mapper.changeHideReview(reviewNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void changeShowReview(long reviewNum) {
		try {
			mapper.changeShowReview(reviewNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public Map<String, Object> dayOfWeekTotalCount(String month) {
		Map<String, Object> resultMap = null;
		
		try {
			resultMap = mapper.dayOfWeekTotalCount(month);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return resultMap;
	}


	
}
