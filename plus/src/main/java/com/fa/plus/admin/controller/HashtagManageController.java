package com.fa.plus.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.admin.domain.HashtagManage;
import com.fa.plus.admin.service.HashtagManageService;

@Controller
@RequestMapping("/admin/hashtagManage")
public class HashtagManageController {

	@Autowired
	private HashtagManageService service;
	
	@RequestMapping(value="list")
	public String list(Model model) throws Exception{
	
		int dataCount = 0;
		
		dataCount = service.dataCount();
		
		List<HashtagManage> list = service.listHashtag();
		
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("list", list);
				
		return ".admin.hashtagManage.list";
	}
	
	@PostMapping("write") 
	public String writeSubmit(HashtagManage dto){
		try {
			service.insertHashtag(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/admin/hashtagManage/list";
	}
	
	@GetMapping("delete")
	public String delete(@RequestParam long tagNum) throws Exception {
		try {
			service.deleteHashtag(tagNum);
		} catch (Exception e) {
		}

		return "redirect:/admin/hashtagManage/list";
	}
}
