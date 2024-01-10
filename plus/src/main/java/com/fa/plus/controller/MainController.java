package com.fa.plus.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.Lesson;
import com.fa.plus.domain.Review;
import com.fa.plus.service.MainpageService;

@Controller
@RequestMapping(value = "/*")
public class MainController {
	
	@Autowired
	private MainpageService mainService;
	
	@Autowired
	@Qualifier("myUtil")
	private MyUtil myUtil;
	
	public String list(
			HttpServletRequest req,
			Model model) throws Exception {
		
		List<Lesson> classList = mainService.lessonList();
		List<Review> reviewList = mainService.reviewList();
		
		
		model.addAttribute("classList", classList);
		model.addAttribute("reviewList", reviewList);
		
		return ".home";
		
	}
	
}
