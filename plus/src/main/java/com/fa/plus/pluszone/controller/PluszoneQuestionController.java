package com.fa.plus.pluszone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fa.plus.pluszone.domain.PluszoneQuesion;
import com.fa.plus.pluszone.service.PluszoneQuestionService;

@Controller
@RequestMapping(value = "/pluszone/question/*")
public class PluszoneQuestionController {
	
	@Autowired
	private PluszoneQuestionService service;
	
	@GetMapping("list")
	public String list(Model model) {
		List<PluszoneQuesion> list = service.listQuesion();
		
		return ".pluszone.question.list";
	}
	
	
		
}
