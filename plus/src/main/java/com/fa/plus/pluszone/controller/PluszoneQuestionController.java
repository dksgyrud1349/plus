package com.fa.plus.pluszone.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.domain.SessionInfo;
import com.fa.plus.pluszone.domain.PluszoneAnswer;
import com.fa.plus.pluszone.domain.PluszoneQuestion;
import com.fa.plus.pluszone.service.PluszoneQuestionService;

@Controller
@RequestMapping(value = "/pluszone/question/*")
public class PluszoneQuestionController {
	
	@Autowired
	private PluszoneQuestionService service;
	
	@GetMapping("list")
	public String list(Model model) {
		List<PluszoneQuestion> list = service.listQuestion();
		
		model.addAttribute("list", list);
		
		return ".pluszone.question.list";
	}
	
	@PostMapping("questionOk")
	public String listSubmit(PluszoneAnswer dto, HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setUserId(info.getUserId());
			service.insertAnswer(dto);
			
		} catch (Exception e) {
		}

		return "redirect:/pluszone/question/complete";
	}
	
	@GetMapping("article")
		public String article(
				@RequestParam String userId,
				Model model) throws Exception{
		
		PluszoneAnswer dto = service.listAnswer(userId);
		
		model.addAttribute("dto", dto);
		
		return ".pluszone.question.article";
	}
	
	
		
}
