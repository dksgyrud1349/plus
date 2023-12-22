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
	
	@Autowired
	private CategoryManageService service;
	
	@Autowired
	@Qualifier("myUtilGeneral")
	private MyUtil myUtil;
	
	@RequestMapping(value = "list")
	public String list(Model model) throws Exception{
		
		int dataCount = 0;
		int dataCount2 = 0;
		
		dataCount = service.dataCount();
		dataCount2 = service.dataCount2();
		
		List<CategoryManage> listCategory1 = service.listMainCategory();
		
		model.addAttribute("listMainCategory", listCategory1);
		for (CategoryManage dto : listCategory1) {
			dto.setMainName(myUtil.htmlSymbols(dto.getMainName()));
		}
		
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("dataCount2", dataCount2);
		
		return ".admin.categoryManage.list";
	}
	
	@GetMapping("detail")
	public String detailSubcategory(@RequestParam long mainNum, Model model) throws Exception {
		CategoryManage dto = service.findByMain(mainNum);
		List<CategoryManage> subList = service.listSubCategory(mainNum);
		
		model.addAttribute("dto", dto);
		model.addAttribute("subList", subList);
		
		return "admin/categoryManage/detailCategory";
	}
	
	@GetMapping("write")
	public String writeForm(Model model) throws Exception {

		//Map<String, Object> map = new HashMap<>();
		
		List<CategoryManage> listCategory1 = service.listMainCategory();
		
		//List<CategoryManage> listCategory2 = service.listSubCategory(map);

		model.addAttribute("mode", "write");
		model.addAttribute("listCategory1", listCategory1);
		//model.addAttribute("listCategory2", listCategory2);

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
	/*
	@GetMapping("update")
	public String updateForm(@RequestParam long num, HttpSession session, Model model)
			throws Exception {

		CategoryManage dto1 = service.findByMain(num);
		CategoryManage dto2 = service.findBySub(num);
		if (dto1 == null) {
			return "redirect:/admin/categoryManage/list";
		}

		Map<String, Object> map = new HashMap<>();
		map.put("mode", "showlist");
		List<CategoryManage> listCategory1 = service.listMainCategory(map);
		
		if (dto2.getSubName() != null) {
			List<CategoryManage> listCategory2 = service.listSubCategory(map);
			model.addAttribute("listCategory2", listCategory2);
		}
		
		model.addAttribute("mode", "update");
		model.addAttribute("dto1", dto1);
		model.addAttribute("dto2", dto2);
		model.addAttribute("listCategory1", listCategory1);

		return ".admin.categoryManage.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(CategoryManage dto, HttpSession session) throws Exception {

		try {
			if (dto.getSubName() != null) {
				service.updateSubCategory(dto);
			}
			service.updateMainCategory(dto);
		} catch (Exception e) {
		}

		return "redirect:/admin/categoryManage/list";
	}
	*/
	@PostMapping("delete")
	@ResponseBody
	public Map<String, Object> delete(@RequestParam long mainNum, HttpSession session) throws Exception {
		String state = "false";

		try {
			service.deleteMainCategory(mainNum);
			state = "true";
		} catch (Exception e) {
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);

		return model;
	}
	
	@ResponseBody
	@PostMapping("deleteSubCategory")
	public Map<String, Object> deleteSubCategory(@RequestParam long subNum) throws Exception {
		Map<String, Object> model = new HashMap<String, Object>();
		String state = "true";
		try {
			service.deleteSubCategory(subNum);
		} catch (Exception e) {
			state = "false";
		}
		model.put("state", state);
		return model;
	}

}
