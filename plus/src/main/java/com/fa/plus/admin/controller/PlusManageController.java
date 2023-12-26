package com.fa.plus.admin.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.domain.AnalysisManage;
import com.fa.plus.admin.domain.MemberManage;
import com.fa.plus.admin.domain.PluszoneAnswerManage;
import com.fa.plus.admin.domain.PluszoneQuestionManage;
import com.fa.plus.admin.service.PlusManageService;
import com.fa.plus.admin.service.PluszoneQManageService;
import com.fa.plus.common.MyUtil;

@Controller
@RequestMapping("/admin/plusManage/*")
public class PlusManageController {

	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private PlusManageService service;
	
	@Autowired
	private PluszoneQManageService questionService;
	
	@RequestMapping(value = "plusList")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "userId") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req, Model model) throws Exception{
		
		String cp = req.getContextPath();

		int size = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		
		dataCount = service.dataCount(map);
		if (dataCount != 0) {
			total_page = myUtil.pageCount(dataCount, size);
		}
		
		if (total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<MemberManage> list = service.plusList(map);
		
		String query = "";
		String listUrl = cp + "/admin/plusManage/plusList";
		
		if(kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl += "?" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		return ".admin.plusManage.plusList";
	}
	
	@GetMapping("article")
	public String articleForm(@RequestParam String userId, @RequestParam String page, Model model) {
		
		// 질문 제목
		List<PluszoneQuestionManage> qlist = questionService.QSubject();
		// 결과지 내용
		List<PluszoneAnswerManage> list = service.findByAnswer(userId);
		
		if(list.isEmpty()) {
			return "redirect:/admin/plusManage/plusList?page=" + page;
		}
		
		model.addAttribute("qlist", qlist);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("userId", userId);
		
		return "admin/plusManage/article";
	}
	
	// 회원상세 정보 : AJAX-Text 응답
	@GetMapping("profile")
	public String detaileMember(@RequestParam String userId, Model model) throws Exception {
		MemberManage dto = service.findById(userId);
		MemberManage memberState = service.findByState(userId);
		List<MemberManage> listState = service.listMemberState(userId);
		
		model.addAttribute("dto", dto);
		model.addAttribute("memberState", memberState);
		model.addAttribute("listState", listState);

		return "admin/plusManage/profile";
	}
	
	@PostMapping("updateMemberState")
	@ResponseBody
	public Map<String, Object> updateMemberState(MemberManage dto) throws Exception {

		String state = "true";
		try {
			// 회원 활성/비활성 변경
			Map<String, Object> map = new HashMap<>();
			map.put("userId", dto.getUserId());
			if (dto.getStateCode() == 0) {
				map.put("enabled", 1);
			} else {
				map.put("enabled", 0);
			}
			service.updateMemberEnabled(map);

			// 회원 상태 변경 사항 저장
			service.insertMemberState(dto);

			if (dto.getStateCode() == 0) {
				// 회원 패스워드 실패횟수 초기화
				service.updateFailureCountReset(dto.getUserId());
			}
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	@GetMapping("updateMembership")
	public String updateMembership(@RequestParam String userId, @RequestParam String page) throws Exception {
		try {
			MemberManage dto = service.findById(userId);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("memberIdx", dto.getMemberIdx());
			if(dto.getMemberIdx() == 51) {
				return "admin.plusManage.plusList";
			}
			service.updateMembership(map);
		} catch (Exception e) {
		}

		return "redirect:/admin/plusManage/plusList";
	}
	
	@GetMapping("graph")
	public String graph(Model model) throws Exception{
		return ".admin.plusManage.graph";
	}
	
	@GetMapping("plusAgeChart")
	@ResponseBody
	public Map<String, Object> plusAgeChart() throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		List<AnalysisManage> list = service.listAgeSection();
		
		model.put("list", list);
		return model;
	}
	
	@GetMapping("classChart")
	@ResponseBody
	public Map<String, Object> classChart() throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		List<AnalysisManage> list = service.classChart();
		
		model.put("list", list);
		return model;
	}
	
	@GetMapping("regionChart")
	@ResponseBody
	public Map<String, Object> regionChart() throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		List<AnalysisManage> list = service.regionChart();
		
		model.put("list", list);
		
		return model;
	}
	
	@GetMapping("priceChart")
	@ResponseBody
	public Map<String, Object> priceChart() throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		List<AnalysisManage> list = service.priceChart();
		
		model.put("list", list);
		return model;
		
	}
	
	@GetMapping("ageChart")
	@ResponseBody
	public Map<String, Object> ageChart() throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		List<AnalysisManage> age = service.ageChart();
		
		model.put("age", age);
		return model;
	}
}
