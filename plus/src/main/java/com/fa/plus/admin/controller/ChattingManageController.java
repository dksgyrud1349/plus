package com.fa.plus.admin.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/chatting/*")
public class ChattingManageController {
	
	@GetMapping("main")
	public String main(
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		String ws_host = "ws://"+req.getServerName()+":"+req.getServerPort()+cp+"/channel";
		
		model.addAttribute("ws_host", ws_host);
		
		return ".admin.chatting.main";
	}
}
