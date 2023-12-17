package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/inquiry/*")
public class InquiryController {

	@RequestMapping("list")
	public String list() throws Exception{
		
		return ".inquiry.list";
	}
}
