package com.fa.plus.chatting;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/chatting/*")
public class ChattingController {
	@GetMapping("main")
	public String main(
			HttpServletRequest req,
			Model model) throws Exception {
		
		String cp = req.getContextPath();
		String ws_host = "ws://"+req.getServerName()+":"+req.getServerPort()+cp+"/channel";
		
		model.addAttribute("ws_host", ws_host);
		
		return ".chatting.main";
	}
}
