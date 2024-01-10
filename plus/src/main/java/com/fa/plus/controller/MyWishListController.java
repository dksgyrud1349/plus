package com.fa.plus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.MyWishList;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.MyWishListService;

@Controller
@RequestMapping("/myPage/wishList/*")
public class MyWishListController {
	
	@Autowired
	private MyWishListService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("mylist")
	public String myWishList(@RequestParam(value = "page", defaultValue = "1") int current_page,
				HttpSession session, Model model, HttpServletRequest req) throws Exception{
		
		String cp = req.getContextPath();
		
		int size = 9;
		int total_page = 0;
		int dataCount = 0;
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		dataCount = service.dataCount(info.getUserId());
		total_page = myUtil.pageCount(dataCount, size);
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) {
			offset = 0;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("offset", offset);
		map.put("size", size);
		
		List<MyWishList> myWishList = service.myWishList(map);
		Map<String, Object> map2 = new HashMap<String, Object>();
		
		long classNum = 0;
		int lessonLikeCount = 0;
		Boolean userLessonLiked = false;
		
		for(MyWishList wl : myWishList) {
			classNum = wl.getClassNum();
			lessonLikeCount = service.lessonLikeCount(classNum);
			wl.setLessonLikeCount(lessonLikeCount);
			
			map2.put("classNum", classNum);
			map2.put("userId", info.getUserId());
			userLessonLiked = service.userLessonLiked(map2);
			wl.setUserLessonLiked(userLessonLiked);
		}
		
		String listUrl = cp + "/wishList/myWishList";
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		String name = info.getUserName();
		
		model.addAttribute("name", name);
		model.addAttribute("myWishList", myWishList);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		
		return ".myPage.myWishList";
	}
	
	@PostMapping("insertLessonLike")
	@ResponseBody
	public Map<String, Object> insertLessonLike(@RequestParam long classNum, @RequestParam boolean userLiked, HttpSession session){
		String state = "true";
		int lessonLikeCount = 0;
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> model = new HashMap<String, Object>();
		
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("classNum", classNum);
		paramMap.put("userId", info.getUserId());
		
		try {
			if(userLiked) {
				service.deleteLessonLike(paramMap);
			} else {
				service.insertLessonLike(paramMap);
			}
		} catch (DuplicateKeyException e) {
			state = "liked";
		} catch (Exception e) {
			state = "false";
		}
		
		lessonLikeCount = service.lessonLikeCount(classNum);
		
		model.put("state", state);
		model.put("lessonLikeCount", lessonLikeCount);
		
		return model;
	}
}
