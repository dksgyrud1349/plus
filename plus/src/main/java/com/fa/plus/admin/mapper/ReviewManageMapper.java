package com.fa.plus.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.admin.domain.ReviewManage;

@Mapper
public interface ReviewManageMapper {

	// 글 개수 세기
	public int dataCount(Map<String, Object> map);
	
	// 리뷰 리스트 출력하기(showReview = 1인 것만)
	public List<ReviewManage> listReview(Map<String, Object> map);
	
	// 숨긴 리스트 출력(showReview = 0인 것만)
	public List<ReviewManage> listHideReview(Map<String, Object> map);
	
	// 파라미터 reviewNum으로 리뷰 데이터 출력하기
	public ReviewManage findByReview(long reviewNum);
	
	// 파라미터 reviewNum으로 showReview 숨김으로 변환(0: 숨김, 1: 공개)
	public void changeHideReview(long reviewNum);
	
	// 파라미터 reviewNum으로 showReview 공개로 변환(0: 숨김, 1: 공개)
	public void changeShowReview(long reviewNum);
	
	// 7일간 잓겅한 리뷰 개수(차트)
	
	
	// 요일별 작성한 리뷰 개수(차트)
	public Map<String, Object> dayOfWeekTotalCount(String month);
}
