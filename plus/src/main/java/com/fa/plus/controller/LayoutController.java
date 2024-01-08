package com.fa.plus.controller;

import java.net.URLDecoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.Lesson;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.LessonService;

@Controller
@RequestMapping("/layout/*")
public class LayoutController {
	@Autowired
	private LessonService lessonService;
	
	@Autowired
	@Qualifier("myUtil")
	private MyUtil myUtil;
	
	@RequestMapping(value = "header")
	public String header(
			@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req, HttpSession session,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		
		int size = 9;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info == null) {
			return "redirect:/member/login";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
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
				
				String paging = myUtil.paging(current_page, total_page, listUrl);

				model.addAttribute("list", list);
				model.addAttribute("page", current_page);
				model.addAttribute("dataCount", dataCount);
				model.addAttribute("size", size);
				model.addAttribute("total_page", total_page);
				model.addAttribute("paging", paging);
				
				model.addAttribute("schType", schType);
				model.addAttribute("kwd", kwd);
				
				return ".layout.header";
		
	}

}
