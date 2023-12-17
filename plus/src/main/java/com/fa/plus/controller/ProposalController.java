package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/proposal/*")
public class ProposalController {

	@RequestMapping("list")
	public String list() throws Exception{
		
		return ".proposal.list";
	}
}
