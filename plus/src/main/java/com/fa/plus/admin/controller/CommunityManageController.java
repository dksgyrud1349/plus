package com.fa.plus.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/communityManage/*")
public class CommunityManageController {

	@RequestMapping(value = "list")
	public String list() throws Exception{
		
		return ".admin.communityManage.list";
	}
	
}
