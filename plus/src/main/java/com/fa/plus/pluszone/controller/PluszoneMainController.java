package com.fa.plus.pluszone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/pluszone/question/*")
public class PluszoneMainController {
	
	@GetMapping("list")
	public String list() {
		return ".pluszone.question.list";
	}
	
}
