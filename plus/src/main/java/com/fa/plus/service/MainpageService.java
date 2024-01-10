package com.fa.plus.service;

import java.util.List;

import com.fa.plus.domain.Lesson;
import com.fa.plus.domain.Review;

public interface MainpageService {
	public List<Lesson> lessonList();
	public List<Review> reviewList();
}
