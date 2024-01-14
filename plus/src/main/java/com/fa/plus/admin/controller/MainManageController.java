package com.fa.plus.admin.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.admin.domain.LessonManage;
import com.fa.plus.admin.domain.MemberManage;
import com.fa.plus.admin.domain.ReviewManage;
import com.fa.plus.admin.service.DeclarationManageService;
import com.fa.plus.admin.service.EventManageService;
import com.fa.plus.admin.service.LessonManageService;
import com.fa.plus.admin.service.MemberManageService;
import com.fa.plus.admin.service.PlusManageService;
import com.fa.plus.admin.service.ReviewManageService;
import com.fa.plus.domain.Declaration;
import com.fa.plus.pluszone.service.MemberPlusService;
import com.fa.plus.pluszone.service.SalesStatusService;

@Controller
public class MainManageController {
	@Autowired	
	private MemberManageService MemberService;
	@Autowired
	private PlusManageService PlusService;
	@Autowired
	private LessonManageService LessonService;
	@Autowired
	private SalesStatusService salesService;
	@Autowired
	private EventManageService EventService;
	@Autowired
	private ReviewManageService reviewService;
	@Autowired
	private DeclarationManageService decManageService;
	@Autowired
	private MemberPlusService memberPlusService;
		
	@RequestMapping(value="/admin", method=RequestMethod.GET)
	public String pluslist(@RequestParam(value = "page", defaultValue = "1") int current_page,
			HttpSession session,
			@RequestParam(defaultValue = "") String enabled,
			Model model) throws Exception {
		int memberDataCount = 0;
		int plusDataCount = 0;
		int lessonDataCount = 0;
		int eventDataCount = 0;
		
		int total_page = 0;
		int size = 5;
		
		Map<String, Object> thisMonth = salesService.thisMonthProduct1();

		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enabled", enabled);
		
		// 총 인원수 구하기
		memberDataCount = MemberService.dataCount(map);
		
		// 총 사업자수 구하기
		plusDataCount = PlusService.dataCount(map);
		map.put("schType", "all");
		map.put("kwd",  "");
		map.put("approvalCode", "1");
		
		// 개설된 클래스 구하기
		lessonDataCount = LessonService.dataCount(map);
		map.put("schType", "all");
		map.put("kwd", "");
		map.put("category", "progress");
		
		// 진행중인 이벤트 구하기
		eventDataCount = EventService.dataCount(map);
		
		model.addAttribute("memberDataCount", memberDataCount);
		model.addAttribute("plusDataCount", plusDataCount);
		model.addAttribute("lessonDataCount", lessonDataCount);
		model.addAttribute("eventDataCount", eventDataCount);
		
		if (total_page < current_page) {
			current_page = total_page;
		}
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		int approvalCode = 0;
		map.put("offset", offset);
		map.put("size", size);
		map.put("approvalCode", approvalCode);
		
		List<LessonManage> list0 = LessonService.lessonList(map);
		model.addAttribute("list0", list0);
		
		size = 10;
		offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		List<MemberManage> list = MemberService.listMember(map);
		
		model.addAttribute("list", list);
		model.addAttribute("thisMonth", thisMonth);
		
		// 신고관리
		// 오늘 날짜 가져오기
		Calendar cal= Calendar.getInstance();
		List<Declaration> declarationList = new ArrayList<Declaration>();
		
		int year = cal.get(Calendar.YEAR);
		int exMonth = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DATE);
		
		String month = Integer.toString(exMonth);
		if(month.length()==1) {
			month = "0"+month;
		}
		
		declarationList = decManageService.adminListDeclarations();
		
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		model.addAttribute("declarationList", declarationList);
		
		// 최근 리뷰 데이터 가져오기
		List<ReviewManage> reviewManageList = new ArrayList<ReviewManage>();
		reviewManageList = reviewService.listReview(map);
		
		model.addAttribute("reviewManageList", reviewManageList);
		
		// 플러스 관리
		int noAppPlusCount = 0;			// 미승인
		int	requestPlusCount = 0;		// 요청
		int appPlusCount = 0;			// 승인
		
		noAppPlusCount = memberPlusService.noApprovedPlus();
		requestPlusCount = memberPlusService.requestPlus();
		appPlusCount = memberPlusService.approvedPlus();
		
		model.addAttribute("noAppPlusCount", noAppPlusCount);
		model.addAttribute("requestPlusCount", requestPlusCount);
		model.addAttribute("appPlusCount", appPlusCount);

		return ".adminLayout";
	}

}