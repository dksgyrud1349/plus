package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/company/*")
public class CompanyIntroController {

	@GetMapping("introduction")
	public String Introduction() {
		
		return ".company.introduction";
	}
}
