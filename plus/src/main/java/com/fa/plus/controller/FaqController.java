package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/faq/*")
public class FaqController {

	@RequestMapping("{category}/list")
	public String list(
			@PathVariable String category,
			Model model) throws Exception{
		
		model.addAttribute("category", category);
		
		return ".faq.list";
	}
}
