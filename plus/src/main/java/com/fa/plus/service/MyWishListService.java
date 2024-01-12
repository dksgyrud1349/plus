package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.MyWishList;

public interface MyWishListService {
	public List<MyWishList> myWishList(Map<String, Object> map);
	public int dataCount(String userId);
	
	public void insertLessonLike(Map<String, Object> map) throws Exception;
	public void deleteLessonLike(Map<String, Object> map) throws Exception;
	public int lessonLikeCount(long classNum);
	public boolean userLessonLiked(Map<String, Object> map);
	
	// 위시리스트 (마이페이지에서 사용)
	public List<MyWishList> wishList(String userId);
}
