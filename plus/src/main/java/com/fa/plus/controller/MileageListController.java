package com.fa.plus.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.Mileage;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.MileageListService;

@Controller
@RequestMapping("/myPage/mileage/*")
public class MileageListController {
	
	@Autowired
	private MileageListService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("list")
	public String myMileageList(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType, 
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req, HttpSession session, Model model) throws Exception{

		String cp = req.getContextPath();
		
		int size = 10;
		int total_page = 0;
		int dataCount = 0;
		
		if(req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		if(info == null) {
			return "redirect:/member/login";
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		
		if(total_page < current_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<Mileage> list = service.myMileageList(map);
		
		int totalMileage = 0;
		for(Mileage dto : list) {
			totalMileage = dto.getTotalMileage();
		}
		
		String listUrl = cp + "/myPage/mileage/list";
		String query = "";
		
		if(kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		if(query.length() != 0) {
			listUrl = cp + "/myPage/mileage/list?" + query;
		}
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("totalMileage", totalMileage);
		model.addAttribute("total_page", total_page);
		model.addAttribute("list", list);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("paging", paging);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);
		
		return ".myPage.myMileageList";
	}
	
	@GetMapping("mileageDetail")
	@ResponseBody
	public Map<String, Object> mileageDetail(@RequestParam long mNum, HttpSession session){
		Map<String, Object> model = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		map.put("userId", info.getUserId());
		map.put("mNum", mNum);
		
		Mileage dto1 = service.findByMState(map);
		
		map.put("mState", dto1.getmState());
		map.put("memberIdx", info.getMemberIdx());
		
		Mileage dto = service.findByMileage(map);
		
		String className = dto.getClassName();
		String classDate = dto.getClassDate();
		int point = dto.getPoint();
		int classTime = dto.getClassTime();
		String mDate = dto.getmDate();
		int mState = dto.getmState();
		
		String state = "";
		if(mState == 0) {
			state = "적립";
		}
		
		if(mState == 1) {
			state = "사용";
		}
		
		if(mState == 2) {
			state = "환불";
		}
		
		model.put("className", className);
		model.put("classDate", classDate);
		model.put("point", point);
		model.put("classTime", classTime);
		model.put("mDate", mDate);
		model.put("mState", mState);
		model.put("state", state);
		
		return model;
	}
}
