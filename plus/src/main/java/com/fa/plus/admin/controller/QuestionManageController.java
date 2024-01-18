package com.fa.plus.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fa.plus.admin.domain.OnedayplusManage;
import com.fa.plus.admin.domain.PluszoneQuestionManage;
import com.fa.plus.admin.service.OnedayplusManageService;
import com.fa.plus.admin.service.PluszoneQManageService;

@Controller
@RequestMapping("/admin/questionManage/*")
public class QuestionManageController {
	
	@Autowired
	private OnedayplusManageService service;
	
	@Autowired
	private PluszoneQManageService pluszoneService;
	
	@RequestMapping(value = "onedayplus")
	public String list(Model model) throws Exception{
		int dataCount = 0;
		
		dataCount = service.dataCount();
		
		List<OnedayplusManage> qsubject = service.QSubject();
		List<OnedayplusManage> qlist = service.listQuestion();
		
		model.addAttribute("qsubject", qsubject);
		model.addAttribute("qlist", qlist);
		model.addAttribute("dataCount", dataCount);
		
		return ".admin.questionManage.question";
	}
	
	@RequestMapping(value="pluszone")
	public String pluszonelist(Model model) throws Exception{
		int dataCount = 0;
		
		
		List<PluszoneQuestionManage> qsubject = pluszoneService.QSubject();
		List<PluszoneQuestionManage> qlist = pluszoneService.listQuestion();
		
		model.addAttribute("qsubject", qsubject);
		model.addAttribute("qlist", qlist);
		model.addAttribute("dataCount", dataCount);
		
		return ".admin.questionManage.pluszonequestion";
	}
}
