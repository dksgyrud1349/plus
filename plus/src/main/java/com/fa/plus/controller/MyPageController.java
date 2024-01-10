package com.fa.plus.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.domain.BookingList;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.BookingListService;

@Controller
@RequestMapping(("/myPage/*"))
public class MyPageController {
	
	@Autowired
	private BookingListService bookingListSerivce;
	
	@RequestMapping(value = "main")
	public String main(HttpSession session, Model model) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info == null) {
			return "redirect:/member/login";
		}
		BookingList paramDto = new BookingList();
		BookingList rtnDto = new BookingList();
		List<BookingList> orderNumList = new ArrayList<BookingList>();
		List<BookingList> rtnList = new ArrayList<BookingList>();
		try {
			
			paramDto.setUserId(info.getUserId());
			
			// userId가 존재해야 if문 조건 참
			if(paramDto.getUserId() != null && !"".equals(paramDto.getUserId())) {
				// userId가 신청한 orderNum 전부 가져오기
				orderNumList = bookingListSerivce.findByOrderNum(paramDto.getUserId());
			}
			
			for(BookingList book : orderNumList) {
				paramDto.setOrderNum(book.getOrderNum());
				paramDto.setRnum(book.getRnum());
				// 주문한 classNum 가져오기
				rtnDto = bookingListSerivce.findByClassNum(book.getOrderNum());
				
				paramDto.setState(rtnDto.getState());
				// classNum과 관련된 클래스 정보 가져오기
				rtnDto = bookingListSerivce.classInfo(rtnDto.getClassNum());
				
				// state 조건문
				if(paramDto.getState() == 0) {
					paramDto.setMode("예약대기");
				}else if(paramDto.getState() == 1) {
					paramDto.setMode("예약확정");
				}else {
					paramDto.setMode("환불");
				}
				
				rtnDto.setOrderNum(paramDto.getOrderNum());
				rtnDto.setRnum(paramDto.getRnum());
				rtnDto.setState(paramDto.getState());
				rtnDto.setMode(paramDto.getMode());
				
				rtnList.add(rtnDto);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("rtnList", rtnList);
		
		return ".myPage.main";
	}
	
	
	// 마이페이지-리뷰
		@GetMapping("review")
		public String review(
				@RequestParam(defaultValue = "review") String mode,
				HttpSession session,
				Model model) throws Exception {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			if(info == null) {
				return "redirect:/member/login";
			}
			model.addAttribute("mode", mode);
			return ".myPage.review";
		}
	
	
	
	
	
}
