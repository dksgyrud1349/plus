package com.fa.plus.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.domain.Refund;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.RefundService;

@Controller
@RequestMapping("/refund/*")
public class RefundController {
	
	@Autowired
	private RefundService service;
	
	@PostMapping("refund")
	public String refund(@RequestParam(name = "oNum") long orderNum, 
				@RequestParam(name = "pay") int cancelAmount,
				Refund dto, HttpSession session) throws Exception{
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		Map<String, Object> map1 = new HashMap<String, Object>();
		Map<String, Object> map2 = new HashMap<String, Object>();
		Map<String, Object> map3 = new HashMap<String, Object>();
		Map<String, Object> map4 = new HashMap<String, Object>();
		Map<String, Object> map5 = new HashMap<String, Object>();
		
		dto.setOrderNum(orderNum);
		dto.setCancelAmount(cancelAmount);
		
		try {
			// 환불 테이블 insert
			service.insertRefund(dto);
			
			// 적립된 적립금 가져오기
			map1.put("orderNum", orderNum);
			map1.put("userId", info.getUserId());
			map1.put("mState", 0);
			Refund dto1 = service.findByMileage(map1);  // 적립된 적립금 가져옴
			
			if(dto1 != null) {
				// 총 적립금에서 적립된 적립금을 빼기
				map2.put("point", dto1.getPoint());
				map2.put("userId", info.getUserId());
				service.updateMinusMileage(map2);
			}
			
			// 사용된 적립금을 가져온다.
			map3.put("orderNum", orderNum);
			map3.put("userId", info.getUserId());
			map3.put("mState", 1);
			Refund dto2 = service.findByMileage(map3);
			
			if(dto2 != null) {
				// 총 적립금에서 사용된 적립금을 더한다.
				map4.put("point", dto2.getPoint());
				map4.put("userId", info.getUserId());
				service.updatePlusMileage(map4);
			}
			
			// 사용자가 예약한 인원수를 구한다.
			Refund dto3 = service.findByCount(orderNum);
			
			// 클래스 상세에서 인원수를 더한다.
			map5.put("count1", dto3.getCount1());
			map5.put("detailNum", dto3.getDetailNum());
			service.updatePlusCount(map5);
			
			service.updateMState(orderNum);
			
			service.updateState(orderNum);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		return "redirect:/myPage/booking/list";
	}
}
