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
}
