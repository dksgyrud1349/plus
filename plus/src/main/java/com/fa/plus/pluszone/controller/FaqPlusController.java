package com.fa.plus.pluszone.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.common.MyUtil;
import com.fa.plus.pluszone.domain.FaqPlus;
import com.fa.plus.pluszone.service.FaqPlusService;

@Controller
@RequestMapping("/pluszone/faq/*")
public class FaqPlusController {
	
	@Autowired
	private FaqPlusService service;
	
	@Autowired
	private MyUtil myUtil;
	

	@GetMapping(value = "main")
	public String main(Model model) throws Exception{
		Map<String, Object> map = new HashMap<>();
		
		map.put("mode", "showFaq");
		List<FaqPlus> listCategory = service.listCategory(map);
		
		model.addAttribute("listCategory", listCategory);
		model.addAttribute("cateNum", "0");
	
		return ".pluszone.faq.main";
	}
	
	@RequestMapping(value= "list")
	public String list(@RequestParam(defaultValue = "0") int cateNum,			
			HttpServletRequest req,
			Model model) throws Exception {
		
		int dataCount = 0;
		//전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cateNum", cateNum);

		dataCount = service.dataCount(map);
		
		// 글리스트
		List<FaqPlus> list = service.listFaq(map);
		for(FaqPlus dto: list) {
			dto.setContent(myUtil.htmlSymbols(dto.getContent()));
		}

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);

		return "pluszone/faq/list";
	}
}
