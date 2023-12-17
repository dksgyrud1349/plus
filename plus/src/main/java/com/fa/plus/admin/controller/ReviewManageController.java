package com.fa.plus.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin/review/*")
public class ReviewManageController {

	@RequestMapping("{category}/list")
	public String list(
			@PathVariable String category,
			HttpServletRequest req,
			Model model) throws Exception{
		
		// 여기서 articleUrl를 list.jsp로 넘겨줘야 article.jsp 사용가능
		
		model.addAttribute("category", category);
		
		return ".admin.review.list";
	}
	
	@GetMapping("article")
	public String article(
			@RequestParam long reviewNum,
			Model model) throws Exception{
		
		return ".admin.review.article";
	}
	
	
}
