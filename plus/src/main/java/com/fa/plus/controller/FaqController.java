package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("faq")
public class FaqController {

	@RequestMapping("list")
	public String list() throws Exception{
		
		return ".faq.list";
	}
}
