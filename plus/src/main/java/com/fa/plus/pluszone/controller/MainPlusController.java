package com.fa.plus.pluszone.controller;

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

import com.fa.plus.domain.Review;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.pluszone.domain.InfoDetail;
import com.fa.plus.pluszone.domain.NoticePlus;
import com.fa.plus.pluszone.domain.PlusSchedule;
import com.fa.plus.pluszone.service.BookingPlusService;
import com.fa.plus.pluszone.service.InfoDetailService;
import com.fa.plus.pluszone.service.NoticePlusService;
import com.fa.plus.pluszone.service.PlusInqService;
import com.fa.plus.pluszone.service.PlusScheduleService;
import com.fa.plus.service.ReviewService;

@Controller
public class MainPlusController {
	@Autowired
	private NoticePlusService noticeService;
	@Autowired
	private BookingPlusService bookingService;
	@Autowired
	private PlusScheduleService scheduleService;
	@Autowired
	private InfoDetailService infoService;
	@Autowired
	private PlusInqService plusInqService;
	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value="/pluszone", method=RequestMethod.GET)
	public String method(HttpSession session,
			Model model) throws Exception {
		int noticeDataCount = 0;
		int bookingDataCount = 0;
		int plusInqDataCount = 0;
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		
		if(info == null) {
			return "redirect:/member/login";
		}
		
		// Map<String, Object> thisMonth = salesService.thisMonthProduct();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("offset", 0);
		map.put("size", 5);
		List<NoticePlus> noticeList = noticeService.listNotice(map);
		
		// 공지사항 개수
		noticeDataCount = noticeService.dataCount(map);

		map.put("schType", "all");
		map.put("kwd", "");
		map.put("memberIdx", info.getMemberIdx());
		
		// 개설된 클래스 개수
		bookingDataCount = bookingService.dataCount(map);
		
		// 문의내역 개수
		plusInqDataCount = plusInqService.dataCount(map);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("noticeDataCount", noticeDataCount);
		model.addAttribute("bookingDataCount", bookingDataCount);
		model.addAttribute("plusInqDataCount", plusInqDataCount);
		//model.addAttribute("thisMonth", thisMonth);
		
		// 오늘의 할일
		// 오늘 날짜 가져오기
		Calendar cal= Calendar.getInstance();
		PlusSchedule scheduleDto = new PlusSchedule();
		List<PlusSchedule> scheduleList = new ArrayList<PlusSchedule>();
		
		int year = cal.get(Calendar.YEAR);
		int exMonth = cal.get(Calendar.MONTH)+1;
		int day = cal.get(Calendar.DATE);
		
		String month = Integer.toString(exMonth);
		if(month.length()==1) {
			month = "0"+month;
		}
		
		scheduleDto.setUserId(info.getUserId());
		scheduleList = scheduleService.todaySchedule(scheduleDto.getUserId());
		
		// 오늘 날짜 데이터 보내기
		model.addAttribute("year", year);
		model.addAttribute("month", month);
		model.addAttribute("day", day);
		model.addAttribute("scheduleList", scheduleList);
		
		// 플러스 정보 데이터 가져오기
		InfoDetail infoDto = new InfoDetail();
		infoDto.setUserId(info.getUserId());						// session ID를 dto의 userId에 set함
		infoDto = infoService.findByNull(infoDto.getUserId());		// 쿼리에서 userId에 따른 세부정보 가져오기
		
		model.addAttribute("infoDto", infoDto);
		
		// 리뷰관리
		long memberIdx = info.getMemberIdx();
		Map<String, Object> reviewMap = new HashMap<String, Object>();
		reviewMap.put("memberIdx", memberIdx);
		int reviewDataCount = 0;
		
		// 리뷰 개수
		reviewDataCount = reviewService.dataCountClass(reviewMap);
		
		// 로그인한 플러스가 볼 리뷰 리스트 출력
		List<Review> reviewList = reviewService.classReviewList(reviewMap);
		
		model.addAttribute("reviewDataCount", reviewDataCount);
		model.addAttribute("reviewList", reviewList);
		
		return ".plusLayout";
	}
}
