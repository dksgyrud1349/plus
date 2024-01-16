package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Review;
import com.fa.plus.domain.Summary;

@Mapper
public interface ReviewMapper {
	public void insertReview(Review dto) throws SQLException;
	public void insertReviewFile(Review dto) throws SQLException;
	
	public Summary findByReviewSummary(Map<String, Object> map);
	public List<Review>listReview(Map<String, Object> map);
	
	public int dataCount2(Map<String, Object> map);
	public List<Review>listReview2(Map<String, Object> map);
	
	public void updateReview(Review dto) throws SQLException; 
	
	public List<Review>listReviewFile(long reviewNum);
	public void deleteReview(long reviewNum) throws SQLException;
	
	public long reviewSeq();
	
	public List<Review>classReviewList(Map<String, Object> map);
	public int dataCountClass(Map<String, Object> map);
	
	// 사업자 메인 페이지에서 offset, size 빼고 검색
	public List<Review> classMainReviewList(long memberIdx);
	
	// 리뷰 개수 (마이페이지에서 사용)
	public int reviewCount(long memberIdx);
	
	public void updateState(Review dto) throws SQLException;
}
