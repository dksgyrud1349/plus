package com.fa.plus.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.domain.AnalysisManage;
import com.fa.plus.admin.service.OnedaypluschartManageService;

@Controller
@RequestMapping("/admin/onedaypluschartManage/*")
public class OnedaypluschartManageController {
	@Autowired
	private OnedaypluschartManageService service;
	
	@GetMapping("list")
	public String list() {
		return ".admin.onedaypluschartManage.list";
	}
	
	@GetMapping("purposeClassChart")
	@ResponseBody
	public Map<String, Object> purposeClassChart() throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		List<AnalysisManage> list = service.purposeClassChart();

		model.put("list", list);

		return model;
	}
	
	@GetMapping("categoryClassChart")
	@ResponseBody
	public Map<String, Object> categoryClassChart() throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		List<AnalysisManage> list = service.categoryClassChart();

		model.put("list", list);

		return model;
	}
	
	@GetMapping("regionClassChart")
	@ResponseBody
	public Map<String, Object> regionClassChart() throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		List<AnalysisManage> list = service.regionClassChart();

		model.put("list", list);

		return model;
	}
	
	@GetMapping("priceClassChart")
	@ResponseBody
	public Map<String, Object> priceClassChart() throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		List<AnalysisManage> list = service.priceClassChart();

		model.put("list", list);

		return model;
	}
	
	@GetMapping("ageClassChart")
	@ResponseBody
	public Map<String, Object> ageClassChart() throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		List<AnalysisManage> list = service.ageClassChart();

		model.put("list", list);

		return model;
	}
}
