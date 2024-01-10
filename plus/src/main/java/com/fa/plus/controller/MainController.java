package com.fa.plus.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fa.plus.common.MyUtil;

@Controller
@RequestMapping(value = "/*")
public class MainController {
	
	
	@Autowired
	@Qualifier("myUtil")
	private MyUtil myUtil;
	
	public String header(
			HttpServletRequest req,
			Model model) throws Exception {
		
		int size = 6;
		int	offset = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("offset", offset);
		map.put("size", size);
		
		return ".layout.header";
		
	}
	
}
