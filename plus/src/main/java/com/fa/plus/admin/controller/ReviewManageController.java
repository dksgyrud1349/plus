package com.fa.plus.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/review/*")
public class ReviewManageController {

	@RequestMapping("{category}/list")
	public String list(
			@PathVariable String category,
			HttpServletRequest req,
			Model model) throws Exception{
		
		model.addAttribute("category", category);
		
		return ".admin.review.list";
	}
	
	
}
