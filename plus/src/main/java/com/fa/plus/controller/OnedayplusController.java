package com.fa.plus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.domain.Lesson;
import com.fa.plus.domain.PlusAns;
import com.fa.plus.domain.PlusQ;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.OnedayplusService;

@Controller
@RequestMapping("/onedayplus/*")
public class OnedayplusController {
	
	@Autowired
	private OnedayplusService service;
	
	@RequestMapping(value = "onedayplus")
	public String list(Model model, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info == null) {
			return "redirect:/member/login";
		}
		List<PlusQ> qSubject = service.QSubject();
		
		List<PlusQ> list = service.listQuestion();
		
		model.addAttribute("qSubject", qSubject);
		model.addAttribute("list", list);
		
		return ".onedayplus.onedayplus";
	}
	
	@ResponseBody
	@PostMapping("question")
	public Map<String, Object> writeSubmit(PlusAns dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String state="true";
		try {
			dto.setUserId(info.getUserId());
			service.insertAnswer(dto);
		} catch (Exception e) {
			state = "false";
		}
		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@GetMapping("result")
	public String result(HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		String userId = info.getUserId();
		// 질문 제목
		List<PlusQ> qlist = service.QSubject();
		
		// 결과지 내용
		List<PlusAns> list = service.listAnswer(userId);
		
		int answerCount = service.answerCount(userId);
		
		if(answerCount != 0) {
			Map<String, Object> map = new HashMap<String, Object>();
			String purpose = service.resultPurpose(userId);
			String category = service.resultCategory(userId);
			String location = service.resultLocation(userId);
			long classprice = service.resultPrice(userId);
			
			map.put("purpose", purpose);
			map.put("category", category);
			map.put("location", location);
			map.put("classprice", classprice);
			map.put("userId", userId);

			List<Lesson> classList = service.resultClass(map);
			int resultCount = service.resultCount(userId);
			
			model.addAttribute("classList", classList);
			model.addAttribute("resultCount", resultCount);
		}
		
		model.addAttribute("qlist", qlist);
		model.addAttribute("list", list);
		model.addAttribute("userId", userId);
		model.addAttribute("answerCount", answerCount);
		
		return ".onedayplus.result";
	}
	
}
