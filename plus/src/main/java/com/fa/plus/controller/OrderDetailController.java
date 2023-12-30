package com.fa.plus.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fa.plus.domain.OrderDetail;
import com.fa.plus.service.OrderDetailService;

@Controller
@RequestMapping("/orderDetail/*")
public class OrderDetailController {

	@Autowired
	private OrderDetailService service;
	
	@RequestMapping("list")
	public String list(OrderDetail dto, Model model) throws Exception{
		String mode = null;
		try {
			
			// 결제한 해당 주문번호를 가져옴
			dto.setOrderNum(service.findByNum());
			
			// 가져온 주문번호를 기반으로 주문 정보 출력
			dto = service.orderList(dto.getOrderNum());
			
			if(dto.getState() == 0) {
				mode = "예약대기";
			}else if(dto.getState() == 1) {
				mode = "예약확정";
			}else {
				mode = "환불";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", mode);
		
		return ".orderDetail.list";
	}
}
