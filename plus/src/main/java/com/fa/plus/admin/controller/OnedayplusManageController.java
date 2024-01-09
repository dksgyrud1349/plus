package com.fa.plus.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fa.plus.admin.domain.OnedayplusManage;
import com.fa.plus.admin.service.OnedayplusManageService;

@Controller
@RequestMapping("/admin/onedayplusManage/*")
public class OnedayplusManageController {
	
	@Autowired
	private OnedayplusManageService service;
	
	
	@RequestMapping(value = "question")
	public String list(Model model) throws Exception{
		int dataCount = 0;
		
		dataCount = service.dataCount();
		
		List<OnedayplusManage> qsubject = service.QSubject();
		List<OnedayplusManage> qlist = service.listQuestion();
		
		model.addAttribute("qsubject", qsubject);
		model.addAttribute("qlist", qlist);
		model.addAttribute("dataCount", dataCount);
		
		return ".admin.onedayplusManage.question";
	}
}
