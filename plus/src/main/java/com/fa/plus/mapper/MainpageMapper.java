package com.fa.plus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Lesson;
import com.fa.plus.domain.Review;

@Mapper
public interface MainpageMapper {
	public List<Lesson> lessonList();
	public List<Review> reviewList();
}
