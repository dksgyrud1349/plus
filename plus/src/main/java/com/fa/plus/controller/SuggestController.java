package com.fa.plus.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.domain.Suggest;
import com.fa.plus.service.SuggestService;

@Controller
@RequestMapping("/suggest/*")
public class SuggestController {
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	@Autowired
	private SuggestService suggestService;
	
	/**
	 * 사용자 화면_클래스 신고 등록
	 * @param dto
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "article")
	public String article(Suggest dto, HttpSession session, Model model) throws Exception{
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		List<Suggest> listClass = null;
		
		try {
			dto.setUserId(info.getUserId());
			dto = suggestService.findById(dto.getUserId());
			
			listClass = suggestService.findByAllClass();
	
		} catch (Exception e) {
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("listClass", listClass);
		
		return ".suggest.article";
		}
		
	@PostMapping("write")
	@ResponseBody
	public Map<String, Object>writeSubmit(Suggest dto)throws Exception{
		String rsltCode = "false";
		String rsltMsg= "제안 등록되지 않았습니다";
		dto.setSubject(rsltMsg);
		
		try {
			dto.setClassNum(suggestService.findByNum(dto.getClassName()));
		
			suggestService.insertSuggest(dto);
			rsltCode="true";
			rsltMsg="제안 등록 완료";
		} catch (Exception e) {
			e.printStackTrace();
		}

		Map<String, Object> model = new HashMap<String,Object>();
		
		
		model.put("rsltCode", rsltCode);
		model.put("rsltMsg", rsltMsg);
		
		return model;
		
	}
}