package com.fa.plus.pluszone.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fa.plus.domain.SessionInfo;
import com.fa.plus.pluszone.domain.NoticePlus;
import com.fa.plus.pluszone.service.NoticePlusService;

@Controller
public class MainPlusController {
	@Autowired
	private NoticePlusService noticePlusService;
	
	@RequestMapping(value="/pluszone", method=RequestMethod.GET)
	public String method(HttpSession session,
			Model model) throws Exception {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("offset", 0);
		map.put("size", 5);
		
		List<NoticePlus> noticeList = noticePlusService.listNotice(map);
		
		model.addAttribute("noticeList", noticeList);
		
		return ".plusLayout";
	}
}
