package com.fa.plus.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.domain.CategoryManage;
import com.fa.plus.admin.service.CategoryManageService;
import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;

@Controller
@RequestMapping("/admin/categoryManage/*")
public class CategoryManageController {
	
	private CategoryManageService service;
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list(
			@RequestParam(defaultValue = "0") long mainNum,
			@RequestParam(defaultValue = "0") long subNum, 
			Model model
			) throws Exception{
		
		int dataCount = 0;
		
		Map<String, Object> map = new HashMap<>();
		map.put("mode", "showlist");
		
		dataCount = service.dataCount(map);
		
		List<CategoryManage> listCategory1 = service.listMainCategory(map);
		List<CategoryManage> listCategory2 = service.listSubCategory(map);
		
		model.addAttribute("listMainCategory", listCategory1);
		for (CategoryManage dto : listCategory1) {
			dto.setMainName(myUtil.htmlSymbols(dto.getMainName()));
		}
		model.addAttribute("listSubCategory", listCategory2);
		for (CategoryManage dto : listCategory2) {
			dto.setSubName(myUtil.htmlSymbols(dto.getSubName()));
		}
		
		model.addAttribute("listCategory1", listCategory1);
		model.addAttribute("listCategory2", listCategory2);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("mainNum", mainNum);
		model.addAttribute("subNum", subNum);
		
		return ".admin.categoryManage.list";
	}
	
	@GetMapping("write")
	public String writeForm(Model model) throws Exception {

		Map<String, Object> map = new HashMap<>();
		
		map.put("mode", "showlist");
		List<CategoryManage> listCategory1 = service.listMainCategory(map);
		List<CategoryManage> listCategory2 = service.listSubCategory(map);

		model.addAttribute("mode", "write");
		model.addAttribute("listCategory1", listCategory1);
		model.addAttribute("listCategory2", listCategory2);

		return ".admin.categoryManage.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(CategoryManage dto, HttpSession session) throws Exception {

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		try {
			dto.setUserId(info.getUserId());
			service.insertMainCategory(dto);
			service.insertSubCategory(dto);
		} catch (Exception e) {
		}

		return "redirect:/admin/categoryManage/list";
	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam long num, HttpSession session, Model model)
			throws Exception {

		CategoryManage dto1 = service.findByMain(num);
		CategoryManage dto2 = service.findBySub(num);
		if (dto1 == null) {
			return "redirect:/admin/categoryManage/list";
		}
		if (dto2 == null) {
			return "redirect:/admin/categoryManage/list";
		}


		Map<String, Object> map = new HashMap<>();
		map.put("mode", "showlist");
		List<CategoryManage> listCategory1 = service.listMainCategory(map);
		List<CategoryManage> listCategory2 = service.listSubCategory(map);

		model.addAttribute("mode", "update");
		model.addAttribute("dto1", dto1);
		model.addAttribute("dto2", dto2);
		model.addAttribute("listCategory1", listCategory1);
		model.addAttribute("listCategory2", listCategory2);

		return ".admin.categoryManage.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(CategoryManage dto, HttpSession session) throws Exception {

		try {
			service.updateMainCategory(dto);
			service.updateSubCategory(dto);
		} catch (Exception e) {
		}

		return "redirect:/admin/categoryManage/list";
	}
	
	@PostMapping("delete")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam long mainNum, @RequestParam long subNum, HttpSession session) throws Exception {
		String state = "false";

		try {
			Map<String, Object> map = new HashMap<>();
			map.put("subNum", subNum);
			map.put("mainNum", mainNum);

			service.deleteSubCategory(subNum);
			service.deleteMainCategory(mainNum);
			state = "true";
		} catch (Exception e) {
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);

		return model;
	}

}
