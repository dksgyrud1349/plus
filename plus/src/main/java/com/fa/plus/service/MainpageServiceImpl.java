package com.fa.plus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.Lesson;
import com.fa.plus.domain.Review;
import com.fa.plus.mapper.MainpageMapper;

@Service
public class MainpageServiceImpl implements MainpageService {
	
	@Autowired
	private MainpageMapper mapper;
	
	@Override
	public List<Lesson> lessonList() {
		List<Lesson> list = null;
		try {
			list = mapper.lessonList();
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public List<Review> reviewList() {
		List<Review> list = null;
		try {
			list = mapper.reviewList();
		} catch (Exception e) {
		}
		return list;
	}

}
