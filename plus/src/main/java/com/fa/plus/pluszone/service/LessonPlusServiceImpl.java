package com.fa.plus.pluszone.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.fa.plus.common.FileManager;
import com.fa.plus.pluszone.domain.LessonPlus;
import com.fa.plus.pluszone.mapper.LessonPlusMapper;

@Service
public class LessonPlusServiceImpl implements LessonPlusService{

	@Autowired
	private LessonPlusMapper mapper;
	
	@Autowired
	private FileManager fileManager;

	@Override
	public void insertLesson(LessonPlus dto, String pathname) throws Exception {
		try {
			// 대표사진
			String photoName = fileManager.doFileUpload(dto.getFirstPhotoFile(), pathname);
			dto.setFirstPhoto(photoName);
			
			// 상품 저장
			long classNum = mapper.lessonSeq();
			dto.setClassNum(classNum);
			dto.setSpecial(0);
			mapper.insertLesson(dto);
			
			// 추가 이미지 저장
			if(! dto.getPhotos().isEmpty()) {
				for(MultipartFile mf : dto.getPhotos()) {
					photoName = fileManager.doFileUpload(mf, pathname);
					if(photoName == null) {
						continue;
					}
					dto.setPhotoName(photoName);
					mapper.insertLessonPhoto(dto);
				}
			}
			
			int startYear = Integer.parseInt(dto.getStartDate().substring(0, 4));
			int startMonth = Integer.parseInt(dto.getStartDate().substring(5, 7));
			int startDay = Integer.parseInt(dto.getStartDate().substring(8));
			
			int endDay = Integer.parseInt(dto.getEndDate().replaceAll("-", ""));
			
			Calendar cal = Calendar.getInstance();
			cal.set(startYear, startMonth - 1, startDay);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
			
			while(true) {
				dto.setClassDay(sdf1.format(cal.getTime()));
				
				if(dto.getStartTime1() != null) {
					dto.setClassDate(dto.getClassDay() + " " + dto.getStartTime1() + ":00");
					mapper.insertLessonDetail(dto);
				} 
				
				if(dto.getStartTime2() != null) {
					dto.setClassDate(dto.getClassDay() + " " + dto.getStartTime2() + ":00");
					mapper.insertLessonDetail(dto);
				}
				
				if(dto.getStartTime3() != null) {
					dto.setClassDate(dto.getClassDay() + " " + dto.getStartTime3() + ":00");
					mapper.insertLessonDetail(dto);
				}
				
				if(dto.getStartTime4() != null) {
					dto.setClassDate(dto.getClassDay() + " " + dto.getStartTime4() + ":00");
					mapper.insertLessonDetail(dto);
				}
				cal.add(Calendar.DATE, 1);
				
				if(Integer.parseInt(sdf.format(cal.getTime())) > endDay) {
					break;
				}
			}
			
			mapper.insertApproval(dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	public List<LessonPlus> myLessonList(Map<String, Object> map) {
		List<LessonPlus> list = null;
		try {
			list = mapper.myLessonList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<LessonPlus> listMainCategory() {
		List<LessonPlus> list = null;
		try {
			list = mapper.listMainCategory();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<LessonPlus> listSubCategory(long mainNum) {
		List<LessonPlus> list = null;
		try {
			list = mapper.listSubCategory(mainNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<LessonPlus> listHashTag() {
		List<LessonPlus> list = null;
		try {
			list = mapper.listHashTag();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public LessonPlus findById(long classNum) {
		LessonPlus dto = null;
		try {
			dto = mapper.findById(classNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public List<LessonPlus> findByDetail(long classNum) {
		List<LessonPlus> list = null;
		try {
			list = mapper.findByDetail(classNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<LessonPlus> listLessonPhoto(long classNum) {
		List<LessonPlus> list = null;
		try {
			list = mapper.listLessonPhoto(classNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void deleteLessonDetail(long detailNum) throws Exception {
		try {
			mapper.deleteLessonDetail(detailNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateLesson(LessonPlus dto, String pathname) throws Exception {
		try {
			// 대표 사진
			String photoName = fileManager.doFileUpload(dto.getFirstPhotoFile(), pathname);
			if(photoName != null) {
				// 이전 사진 지우기
				if(dto.getFirstPhoto().length() != 0) {
					fileManager.doFileDelete(dto.getFirstPhoto(), pathname);
				}
				dto.setFirstPhoto(photoName);
			}
			
			mapper.updateLesson(dto);
			
			// 추가 이미지
			if(! dto.getPhotos().isEmpty()) {
				for(MultipartFile mf : dto.getPhotos()) {
					photoName = fileManager.doFileUpload(mf, pathname);
					if(photoName == null) {
						continue;
					}
					dto.setPhotoName(photoName);
					mapper.insertLessonPhoto(dto);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	@Override
	public void updateLessonDetail(Map<String, Object> map) throws Exception {
		try {
			mapper.updateLessonDetail(map);  // count, classDate, dContent
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteLesson(long classNum) throws Exception {
		try {
			mapper.deleteLesson(classNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void deleteLessonPhoto(long photoNum, String pathname) throws Exception {
		try {
			if(pathname != null) {
				fileManager.doFileDelete(pathname);
			}
			mapper.deleteLessonPhoto(photoNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public LessonPlus findBySubCategory(long subNum) {
		LessonPlus dto = null;
		try {
			dto = mapper.findBySubCategory(subNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int reportCount(long classNum) {
		int result = 0;
		try {
			result = mapper.reportCount(classNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int plusClassList(long memberIdx) {
		int count = 0;
		try {
			count = mapper.plusClassList(memberIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}
