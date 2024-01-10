package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.Lesson;
import com.fa.plus.domain.LessonDetail;
import com.fa.plus.mapper.LessonMapper;

@Service
public class LessonServiceImpl implements LessonService{

	@Autowired
	private LessonMapper mapper;
	
	@Override
	public List<Lesson> allLessonList(Map<String, Object> map) {
		List<Lesson> list = null;
		try {
			list = mapper.allLessonList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List<Lesson> listMainCategory() {
		List<Lesson> list = null;
		try {
			list = mapper.listMainCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Lesson> listSubCategory(long mainNum) {
		List<Lesson> list = null;
		try {
			list = mapper.listSubCategory(mainNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Lesson findById(long classNum) {
		Lesson dto = null;
		try {
			dto = mapper.findById(classNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return dto;
	}

	@Override
	public List<Lesson> listLessonPhoto(long classNum) {
		List<Lesson> list = null;
		
		try {
			list = mapper.listLessonPhoto(classNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
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
			Lesson dto = mapper.userLessonLiked(map);
			if(dto != null) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 강좌 상세 페이지(수강 날짜)
	@Override
	public List<LessonDetail> getLessonDtlDate(long classNum) {
		List<LessonDetail> list = null;
			
		try {
			list = mapper.getLessonDtlDate(classNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return list;
	}
		
		// 강좌 상세 페이지(수강 시간)
	@Override
	public List<LessonDetail> getLessonDtlTime(Map<String, Object> map) {
		List<LessonDetail> list = null;
			
		try {
			list = mapper.getLessonDtlTime(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		return list;
	}

	@Override
	public List<Lesson> newClassList() {
		List<Lesson> list = null;
		try {
			list = mapper.newClassList();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
