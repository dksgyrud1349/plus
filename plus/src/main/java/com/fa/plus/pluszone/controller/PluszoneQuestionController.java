package com.fa.plus.pluszone.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		List<PluszoneQuestion> list = service.QSubject();
		
		List<PluszoneQuestion> sublist = service.listQuestion();
		
		model.addAttribute("list", list);
		model.addAttribute("sublist", sublist);
		
		return ".pluszone.question.list";
	}
	
	@PostMapping("questionOk")
	public String listSubmit(PluszoneAnswer dto, HttpSession session, final RedirectAttributes reAttr) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setUserId(info.getUserId());
			service.insertAnswer(dto);
			
		} catch (Exception e) {
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append(info.getUserName() + "님의 플러스존 가입요청이 정상적으로 처리되었습니다.<br>");
		sb.append("관리자의 승인 후 플러스존 이용이 가능합니다.<br>");

		// 리다이렉트된 페이지에 값 넘기기
		reAttr.addFlashAttribute("message", sb.toString());
		reAttr.addFlashAttribute("title", "플러스존 가입요청");
		
		return "redirect:/pluszone/question/complete";
	}
	
	@GetMapping("complete")
	public String complete(@ModelAttribute("message") String message) throws Exception {

		// 컴플릿 페이지(complete.jsp)의 출력되는 message와 title는 RedirectAttributes 값이다.
		// F5를 눌러 새로 고침을 하면 null이 된다.

		if (message == null || message.length() == 0) // F5를 누른 경우
			return "redirect:/";

		return ".pluszone.question.complete";
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
