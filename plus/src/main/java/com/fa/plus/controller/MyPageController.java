package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(("/myPage/*"))
public class MyPageController {
	
	
	// 마이페이지-리뷰/Q&A(사업자 - 사용자간 문의 사항 inquiry table)
	@GetMapping("review")
	public String review(@RequestParam(defaultValue = "review") String mode, Model model) throws Exception {

		model.addAttribute("mode", mode);
		return ".myPage.review";
	}
}
