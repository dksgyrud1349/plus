package com.fa.plus.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.Terms;
import com.fa.plus.service.TermsService;

@Controller
@RequestMapping("/terms/*")
public class TermsController {
	@Autowired
	private TermsService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list( HttpServletRequest req, Model model) throws Exception {
		List<Terms> list = service.listTerms();
		
		for(Terms dto : list) {
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		}
		
		model.addAttribute("list", list);
		
		return "terms/list";
	}
}
