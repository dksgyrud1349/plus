package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.Review;
import com.fa.plus.domain.Summary;

public interface ReviewService {
	public void insertReview(Review dto, String pathname) throws Exception;
	
	public Summary findByReviewSummary(Map<String, Object> map);
	public List<Review>listReview(Map<String, Object> map);
	
	public int dataCount2(Map<String, Object> map);
	public List<Review>listReview2(Map<String, Object> map);
	
	public void updateReview(Review dto) throws Exception;
	
	public void deleteReview(long reviewNum, String pathname) throws Exception;
	
	public List<Review>classReviewList(Map<String, Object> map);
	public int dataCountClass(Map<String, Object> map);
	
	// 사업자 메인 페이지에서 offset, size 빼고 검색
	public List<Review> classMainReviewList(long memberIdx);
}
