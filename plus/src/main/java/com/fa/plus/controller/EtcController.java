package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/etc/*")
public class EtcController {

	@RequestMapping("list")
	public String list() throws Exception{
		
		return ".etc.list";
	}
}
