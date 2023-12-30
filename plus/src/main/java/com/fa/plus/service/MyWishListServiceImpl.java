package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.MyWishList;
import com.fa.plus.mapper.MyWishListMapper;

@Service
public class MyWishListServiceImpl implements MyWishListService{

	@Autowired
	private MyWishListMapper mapper;
	
	@Override
	public List<MyWishList> myWishList(Map<String, Object> map) {
		List<MyWishList> list = null;
		try {
			list = mapper.myWishList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(String userId) {
		int result = 0;
		try {
			result = mapper.dataCount(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void insertLessonLike(Map<String, Object> map) throws Exception {
		try {
			mapper.insertLessonLike(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteLessonLike(Map<String, Object> map) throws Exception {
		try {
			mapper.deleteLessonLike(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int lessonLikeCount(long classNum) {
		int result = 0;
		try {
			result = mapper.lessonLikeCount(classNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean userLessonLiked(Map<String, Object> map) {
		boolean result = false;
		try {
			MyWishList dto = mapper.userLessonLiked(map);
			if(dto != null) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
