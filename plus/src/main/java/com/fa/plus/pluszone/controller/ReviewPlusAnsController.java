package com.fa.plus.pluszone.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.Review;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.ReviewService;

@Controller
@RequestMapping("/pluszone/review/*")
public class ReviewPlusAnsController {
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private ReviewService service;
	
	@GetMapping("list")
	public String reviewList(@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {
		try {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			long memberIdx = info.getMemberIdx();
			Map<String, Object> map = new HashMap<String, Object>();
			
			int size = 5;
			int dataCount = 0;
			
			map.put("memberIdx", memberIdx);
			
			dataCount = service.dataCountClass(map);
			
			int total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;

			map.put("offset", offset);
			map.put("size", size);
			
			List<Review> list = service.classReviewList(map);
			
			String cp = req.getContextPath();
			String listUrl = cp + "/pluszone/reivew/list";
			
			String paging = myUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("list", list);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("page", current_page);
			model.addAttribute("paging", paging);
			model.addAttribute("total_page", total_page);
		
		} catch (Exception e) {
		}
		
		return ".pluszone.review.list";
	}
	
	@PostMapping("answer")
	public String reviewAnswer(Review dto, @RequestParam String page) throws Exception {
		try {
			service.updateReview(dto);
		} catch (Exception e) {
		}
		return "redirect:/pluszone/review/list?page="+page;
	}
	
	
}
