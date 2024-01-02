package com.fa.plus.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.domain.Order;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.OrderService;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	@RequestMapping("payment")
	public String payment(@RequestParam long classNum,
						@RequestParam(name = "classDay") String classDate1,
						@RequestParam String classTime,
						HttpSession session, Model model) {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		// 주문자의 userId, userName, birth, totalMileage 가져오기
		Order user = service.findByOrderHuman(info.getUserId());
		
		String startTime = "";
		String endTime = "";
		
		String t[] = classTime.split("~");
		startTime = t[0];
		endTime = t[1];
		
		String classDate = classDate1 + " " + startTime + ":00";
		Map<String, Object> map1 = new HashMap<String, Object>();
		
		map1.put("classDate", classDate);
		map1.put("classNum", classNum);
		
		// 클래스 정보(클래스번호, 클래스상세번호, 최대인원수, 수업날짜, 가격, 마일리지)
		// 이벤트 클래스일 경우(클래스번호, 클래스상세번호, 최대인원수, 수업날짜, 가격, 마일리지, 할인가격, 할인퍼센트)
		try {
			
			Order lesson = service.eventLesson(map1);
			
			if(lesson == null) {
				lesson = service.findLessonDetail(map1);
			}
			
			model.addAttribute("classDate1", classDate1);
			model.addAttribute("user", user);
			model.addAttribute("lesson", lesson);
			model.addAttribute("startTime", startTime);
			model.addAttribute("endTime", endTime);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ".order.payment";
	}
	
	@PostMapping("insert")
	public String paymentSubmit(Order dto, HttpSession session) throws Exception {
		long detailNum = dto.getDetailNum();  // 클래스상세번호
		int uMileage = dto.getuMileage();  // 사용한 적립금
		int mileage = dto.getMileage();  // 적립되는 적립금	
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		map.put("classNum", dto.getClassNum());
		map.put("memberIdx", info.getMemberIdx());
		map.put("detailNum", detailNum);
		map.put("count", dto.getCount());
		
		dto.setMemberIdx(info.getMemberIdx());
		dto.setUserId(info.getUserId());
		
		try {
			service.insertOrders(dto);
			
			if(uMileage != 0) { // 사용한 적립금이 있으면
				map.put("uMileage", uMileage);
				service.updateUmileage(map);
				service.insertUMileage(dto);
			}
			
			if(mileage != 0) {  // 클래스 적립금이 있으면
				map.put("mileage", mileage);
				service.updateMileage(map);
				service.insertMileage(dto);
			}
			
			// 주문한 인원수만큼 차감
			service.updateCount(map);
				
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/lesson/main";
	}
	
	@GetMapping("cal1")
	@ResponseBody
	public Map<String, Object> cal1(@RequestParam(name = "count") int count, @RequestParam(name = "price") int price){
		Map<String, Object> model = new HashMap<String, Object>();
		int pay = count * price;
		model.put("pay", pay);
		return model;
	}
	
	@GetMapping("cal2")
	@ResponseBody
	public Map<String, Object> cal2(@RequestParam(name = "count") int count, 
									@RequestParam(name = "price") int price,
									@RequestParam(name = "uMileage") int uMileage){
		
		Map<String, Object> model = new HashMap<String, Object>();
		int pay = count * price - uMileage;
		model.put("pay", pay);
		return model;
	}
}
