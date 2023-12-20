package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(("/myPage/*"))
public class MyPageController {
	
	@RequestMapping(value = "main")
	public String main() {
		
		return ".myPage.main";
	}
	
	
	
	
	
}
