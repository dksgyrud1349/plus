package com.fa.plus.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.domain.ReviewManage;
import com.fa.plus.admin.service.ReviewManageService;
import com.fa.plus.common.MyUtil;

@Controller
@RequestMapping("/admin/reviewManage/*")
public class ReviewManageController {

	@Autowired
	private ReviewManageService service;
	
	@Autowired
	private MyUtil myUtil;
	
	@RequestMapping("{category}/list")
	public String list(
			@PathVariable String category
			, @RequestParam(value = "page", defaultValue = "1") int current_page
			, HttpServletRequest req
			, Model model) throws Exception{
		
		List<ReviewManage> list = new ArrayList<ReviewManage>();
		List<ReviewManage> listHide = new ArrayList<ReviewManage>();
		
		int size = 6;
		int total_page = 0;
		int dataCount = 0;
		
		/*
		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}
		 */
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		
		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if(current_page > total_page) {
			current_page = total_page;
		}
		
		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		
		map.put("offset", offset);
		map.put("size", size);
		
		// 리뷰 리스트 출력
		if(category.equals("all")) {
			list = service.listReview(map);
		}
		 
		if(category.equals("hide")){
			listHide = service.listHideReview(map);
		}
		
		String cp = req.getContextPath();
		//String query = "";
		String listUrl = cp + "/admin/reviewManage/"+category+"/list";
		String articleUrl = cp + "/admin/reviewManage/"+category+"/article?page="+current_page;
		
		String paging = myUtil.paging(current_page, total_page, listUrl);
		
		model.addAttribute("list", list);
		model.addAttribute("listHide", listHide);
		model.addAttribute("category", category);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("paging", paging);
		
		return ".admin.reviewManage.list";
	}
	
	@GetMapping("{category}/article")
	public String article(
			  @PathVariable String category
			, @RequestParam long reviewNum
			, @RequestParam int page
			, Model model) throws Exception{
		
		ReviewManage dto = new ReviewManage();
		String mode = null;
		String showResult = null;
		
		try {
			dto = service.findByReview(reviewNum);
			
			if(category.equals("all")) {
				mode = "숨김";
			}
			else{
				mode = "공개";
			}
			
			if(dto.getShowReview() == 0) {
				showResult = "숨김상태";
			}else {
				showResult = "공개상태";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("dto", dto);
		model.addAttribute("mode", mode);
		model.addAttribute("category", category);
		model.addAttribute("page", page);
		model.addAttribute("showResult", showResult);
		
		return ".admin.reviewManage.article";
	}
	
	@GetMapping("{category}/change")
	@ResponseBody
	public Map<String, Object> change(
			  @PathVariable String category
			, @RequestParam long reviewNum
			, @RequestParam int page) throws Exception{
		
		Map<String, Object> model = new HashMap<String, Object>();
		String state = "false";
		try {
			
			if(category.equals("hide")) {
				// 리뷰를 공개로 변환
				service.changeShowReview(reviewNum);
			}

			if(category.equals("all")){
				// 리뷰를 숨김으로 변환
				service.changeHideReview(reviewNum);
			}
			
			state = "true";
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.put("category", category);
		model.put("page", page);
		model.put("state", state);
		
		return model;
	}
}
