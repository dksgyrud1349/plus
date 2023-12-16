package com.fa.plus.admin.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.admin.domain.CommunityManage;
import com.fa.plus.admin.domain.ReplyManage;
import com.fa.plus.admin.service.CommunityManageService;
import com.fa.plus.common.MyUtil;

@Controller
@RequestMapping("/admin/communityManage/*")
public class CommunityManageController {

	@Autowired
	private CommunityManageService communityManageService;

	@Autowired
	private MyUtil myUtil;

	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType, @RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req, Model model) throws Exception {

		String cp = req.getContextPath();

		int size = 10;
		int total_page;
		int dataCount;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = communityManageService.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);

		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		List<CommunityManage> list = communityManageService.communityList(map);

		String query = "";
		String listUrl = cp + "/admin/communityManage/list";
		String articleUrl = cp + "/admin/communityManage/article?page=" + current_page;

		if (kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/admin/communityManage/list?" + query;
			articleUrl = cp + "/admin/communityManage/article?page=" + current_page + "&" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("list", list);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("articleUrl", articleUrl);
		model.addAttribute("page", current_page);
		model.addAttribute("paging", paging);

		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);

		return ".admin.communityManage.list";
	}

	@GetMapping("article")
	public String article(@RequestParam long num, @RequestParam String page,
			@RequestParam(defaultValue = "all") String schType, @RequestParam(defaultValue = "") String kwd,
			HttpSession session, Model model) throws Exception {

		kwd = URLDecoder.decode(kwd, "utf-8");

		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}

		CommunityManage dto = communityManageService.findById(num);
		if (dto == null) {
			return "redirect:/admin/communityManage/list?" + query;
		}

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("num", num);

		CommunityManage prevDto = communityManageService.findByPrev(map);
		CommunityManage nextDto = communityManageService.findByNext(map);

		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);
		model.addAttribute("page", page);
		model.addAttribute("query", query);

		return ".admin.communityManage.article";
	}

	@GetMapping("delete")
	public String delete(@RequestParam long num, @RequestParam String page,
			@RequestParam(defaultValue = "all") String schType, @RequestParam(defaultValue = "") String kwd,
			HttpSession session) throws Exception {

		kwd = URLDecoder.decode(kwd, "utf-8");
		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}

		communityManageService.deleteCommunity(num);

		return "redirect:/admin/communityManage/list?" + query;

	}

	// 댓글 리스트 : AJAX-TEXT
	@GetMapping("listReply")
	public String listReply(@RequestParam long num, 
			@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
			HttpSession session,
			Model model) throws Exception {
		int size = 5;
		int total_page = 0;
		int dataCount = 0;
		Map<String, Object> map = new HashMap<>();
		map.put("num", num);
		
		dataCount = communityManageService.replyCount(map);
		total_page = myUtil.pageCount(dataCount, size);
		if (current_page > total_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;
		map.put("offset", offset);
		map.put("size", size);
		List<ReplyManage>listReply = communityManageService.listReply(map);	
		for (ReplyManage dto : listReply) {
			dto.setReContent(dto.getReContent().replaceAll("\n", "<br>"));
		}
		// AJAX 용 페이징
		String paging = myUtil.pagingMethod(current_page, total_page, "listPage");

		// 포워딩할 jsp로 넘길 데이터
		model.addAttribute("listReply", listReply);
		model.addAttribute("pageNo", current_page);
		model.addAttribute("replyCount", dataCount);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);

		return "admin/communityManage/listReply";
		}
	
	// 댓글 및 댓글의 답글 삭제 : AJAX-JSON
	@PostMapping("deleteReply")
	@ResponseBody
	public Map<String, Object> deleteReply(@RequestParam Map<String, Object> paramMap) {
		String state = "true";

		try {
			communityManageService.deleteReply(paramMap);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> map = new HashMap<>();
		map.put("state", state);
		return map;
	}
}
