package com.fa.plus.controller;

import java.net.URLDecoder;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.Lesson;
import com.fa.plus.domain.LessonDetail;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.LessonService;

@Controller
@RequestMapping("/lesson/*")
public class LessonController {
	@Autowired
	private LessonService lessonService;
	
	@Autowired
	@Qualifier("myUtil")
	private MyUtil myUtil;
	
	@RequestMapping(value = "main")
	public String main(
				@RequestParam(value = "page", defaultValue = "1") int current_page,
				@RequestParam(defaultValue = "all") String schType,
				@RequestParam(defaultValue = "") String kwd, 
				@RequestParam(defaultValue = "0") long subNum,
				@RequestParam(defaultValue = "0") long mainNum, 
				HttpServletRequest req, HttpSession session, 
				Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int size = 9;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		List<Lesson> listMainCategory = lessonService.listMainCategory();
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info == null) {
			return "redirect:/member/login";
		}
		
		List<Lesson> listSubCategory = null;
		if(mainNum != 0 && listMainCategory.size() != 0) {
			listSubCategory = lessonService.listSubCategory(mainNum);
		}
		
		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subNum", subNum);
		map.put("mainNum", mainNum);
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		dataCount = lessonService.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		map.put("mainNum", mainNum);
		map.put("subNum", subNum);
		
		// 글 리스트
		List<Lesson> list = lessonService.allLessonList(map);
		Map<String, Object> map2 = new HashMap<String, Object>();
		
		long classNum = 0;
		int lessonLikeCount = 0;
		Boolean userLessonLiked = false;
		
		for(Lesson le : list) {
			classNum = le.getClassNum();
			lessonLikeCount = lessonService.lessonLikeCount(classNum);
			le.setLessonLikeCount(lessonLikeCount);
			
			map2.put("classNum", classNum);
			map2.put("userId", info.getUserId());
			userLessonLiked = lessonService.userLessonLiked(map2);
			le.setUserLessonLiked(userLessonLiked);
		}
		
		String listUrl = cp + "/lesson/main";		
		String query = "mainNum=" + mainNum + "&subNum=" + subNum;
		
		if(kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl = cp + "/lesson/main?" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("listMainCategory", listMainCategory);
		model.addAttribute("listSubCategory", listSubCategory);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("subNum", subNum);
		model.addAttribute("mainNum", mainNum);
		
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		return ".lesson.lessonList";
	}
	
	@GetMapping("listSubCategory")
	@ResponseBody
	public Map<String, Object> listSubCategory(@RequestParam long mainNum){
		Map<String, Object> model = new HashMap<String, Object>();
		List<Lesson> listSubCategory = lessonService.listSubCategory(mainNum);
		model.put("listSubCategory", listSubCategory);
		return model;
	}
	
	@PostMapping("insertLessonLike")
	@ResponseBody
	public Map<String, Object> insertLessonLike(@RequestParam long classNum, 
			@RequestParam boolean userLiked,
			HttpSession session){
		
		String state = "true";
		int lessonLikeCount = 0;
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> model = new HashMap<String, Object>();
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("classNum", classNum);
		paramMap.put("userId", info.getUserId());
		
		try {
			if(userLiked) {
				lessonService.deleteLessonLike(paramMap);
			} else {
				lessonService.insertLessonLike(paramMap);
			}
		} catch (DuplicateKeyException e) {
			state = "liked";
		} catch (Exception e) {
			state = "false";
		}
		
		lessonLikeCount = lessonService.lessonLikeCount(classNum);
		
		model.put("state", state);
		model.put("lessonLikeCount", lessonLikeCount);
		
		return model;
	}
	
	/**
	 * 강좌상세페이지 이동
	 * @param classNum
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@GetMapping("detail/{classNum}")
	public String buyRequest(
			@PathVariable Long classNum,
			Model model, HttpSession session
			) throws Exception{

		try {
			Lesson dto = lessonService.findById(classNum);
			if(dto == null || dto.getShowClass() == 1) {
				return "redirect:/lesson/main";
			}
			
			List<Lesson> listPhoto = lessonService.listLessonPhoto(classNum);
			List<LessonDetail> lessonDtlDate = lessonService.getLessonDtlDate(classNum);
			
			dto.setPhotoName(dto.getFirstPhoto());
			listPhoto.add(0, dto);
			
			List<Lesson> newClassList = lessonService.newClassList();
			
			model.addAttribute("dto", dto);
			model.addAttribute("listPhoto", listPhoto);
			model.addAttribute("newClassList", newClassList);
			model.addAttribute("lessonDtlDate", lessonDtlDate);
		
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/lesson/main";
		}
		
		return ".lesson.lessonDetail";
	}
	
	// 수강 날짜에 따른 수강 시간 출력
	@GetMapping("lessonDtlTime")
	@ResponseBody
	public Map<String, Object> lessonDtlTime(@RequestParam("classDay") String classDate, @RequestParam long classNum) throws Exception{
		Map<String, Object> timeInfo = new HashMap<String, Object>();
		Map<String, Object> param = new HashMap<String, Object>();
		
		param.put("classDate", classDate);
		param.put("classNum", classNum);
		List<LessonDetail> lessonDtlTime = lessonService.getLessonDtlTime(param);
		
		timeInfo.put("lessonDtlTime", lessonDtlTime);
		return timeInfo;
	}
}
