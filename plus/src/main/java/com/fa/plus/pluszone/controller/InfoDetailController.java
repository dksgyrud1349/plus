package com.fa.plus.pluszone.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fa.plus.domain.SessionInfo;
import com.fa.plus.pluszone.domain.InfoDetail;
import com.fa.plus.pluszone.service.InfoDetailService;

@Controller
@RequestMapping("/pluszone/infoDetail/*")
public class InfoDetailController {

	@Autowired
	private InfoDetailService service;
	
	@RequestMapping("write")
	public String writeForm(HttpSession session, Model model) throws Exception{
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		InfoDetail dto = new InfoDetail();
		String mode = null;
		try {
			
			dto.setUserId(info.getUserId());
			
			if(service.findByNull(dto.getUserId()) == null) {
				mode = "write";
			}else {
				mode = "update";
				dto = service.findByNull(dto.getUserId());
				dto.setUserId(info.getUserId());
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("mode", mode);
		model.addAttribute("dto", dto);
		
		return ".pluszone.infoDetail.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(
					  InfoDetail dto
					, HttpSession session
					, Model model) throws Exception{
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "infoDetail";
		
		try {
			service.insertInfoDetail(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/pluszone";
	}
	
	@PostMapping("update")
	public String updateSubmit(
					  InfoDetail dto
					, HttpSession session
					, Model model) throws Exception{
		
		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "infoDetail";
		
		try {
			service.updateInfoDetail(dto, pathname);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/pluszone";
	}
}
