package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.MyWishList;

@Mapper
public interface MyWishListMapper {
	public List<MyWishList> myWishList(Map<String, Object> map);
	public int dataCount(String userId);
	
	public void insertLessonLike(Map<String, Object> map) throws SQLException;  // 게시글 좋아요 추가
	public void deleteLessonLike(Map<String, Object> map) throws SQLException;  // 게시글 좋아요 삭제
	public int lessonLikeCount(long classNum);  // 게시글 좋아요 개수
	public MyWishList userLessonLiked(Map<String, Object> map);  // 게시글 좋아요 여부
}
