package com.fa.plus.pluszone.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainPlusController {
	
	@RequestMapping(value="/pluszone", method=RequestMethod.GET)
	public String method() {
		return ".plusLayout";
	}
}
