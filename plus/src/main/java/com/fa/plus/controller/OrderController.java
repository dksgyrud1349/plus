package com.fa.plus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/order/*")
public class OrderController {
	@RequestMapping("payment")
	public String paymentForm() {
			
	return ".order.payment";
	}
}
