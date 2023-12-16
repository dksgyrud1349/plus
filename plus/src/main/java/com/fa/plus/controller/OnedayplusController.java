package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/onedayplus/*")
public class OnedayplusController {
	@RequestMapping(value = "onedayplus")
	public String list() {
	
	return ".onedayplus.onedayplus";
	}
}
