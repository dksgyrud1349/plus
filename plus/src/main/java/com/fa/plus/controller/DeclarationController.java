package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/declaration/*")
public class DeclarationController {

	@RequestMapping("article")
	public String article() throws Exception{
		
		return ".declaration.article";
	}
}
