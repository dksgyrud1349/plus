package com.fa.plus.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.domain.Declaration;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.DeclarationService;

@Controller
@RequestMapping("/declaration/*")
public class DeclarationController {

	@Autowired
	private DeclarationService declarationService;
	
	/**
	 * 사용자 화면_클래스 신고 등록
	 * @param dto
	 * @param session
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("article")
	public String article(Declaration dto, HttpSession session, Model model) throws Exception{
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info == null) {
			return "redirect:/member/login";
		}
		List<Declaration> listClass = null;
		
		try {
			// 로그인한 회원 정보 가져오기
			dto.setUserId(info.getUserId());
			dto = declarationService.findById(dto.getUserId());
			
			// 클래스 목록 전부 가져오기
			listClass = declarationService.findByAllClass();
			
		} catch (Exception e) {
			
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("listClass", listClass);
		
		return ".declaration.article";
	}
	
	@PostMapping("write")
	@ResponseBody
	public Map<String, Object> writeSubmit(Declaration dto) throws Exception{
		String rsltCode = "false";
		String rsltMsg = "신고가 등록되지 않았습니다.";
		
		try {
			dto.setClassNum(declarationService.findByNum(dto.getClassName()));
			
			declarationService.insertDeclaration(dto);
			rsltCode = "true";
			rsltMsg = "신고 등록이 완료되었습니다.";
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ajax callback으로 rsltCode / rsltMsg
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("rsltCode", rsltCode);
		model.put("rsltMsg", rsltMsg);
		
		return model;
	}
}
