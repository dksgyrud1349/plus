package com.fa.plus.pluszone.controller;

import java.io.File;
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

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.pluszone.domain.LessonPlus;
import com.fa.plus.pluszone.service.LessonPlusService;

@Controller
@RequestMapping("/pluszone/lessonPlus/*")
public class LessonPlusController {

	@Autowired
	private LessonPlusService service;

	@Autowired
	private MyUtil myUtil;

	@RequestMapping("main")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "className") String schType, @RequestParam(defaultValue = "") String kwd,
			@RequestParam(defaultValue = "0") long subNum, @RequestParam(defaultValue = "0") long mainNum,
			@RequestParam(defaultValue = "0") long tagNum, HttpServletRequest req, HttpSession session, Model model)
			throws Exception {

		String cp = req.getContextPath();
		int size = 10;
		int total_page = 0;
		int dataCount = 0;

		if (req.getMethod().equalsIgnoreCase("GET")) {
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		List<LessonPlus> listMainCategory = service.listMainCategory();

		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("subNum", subNum);
		map.put("mainNum", mainNum);
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("memberIdx", info.getMemberIdx());
		map.put("tagNum", tagNum);

		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);

		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if (offset < 0)
			offset = 0;

		map.put("offset", offset);
		map.put("size", size);

		List<LessonPlus> list = service.myLessonList(map);

		String listUrl = cp + "/lessonPlus/list";
		String query = "mainNum=" + mainNum + "&subNum=" + subNum;

		if (kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}

		if (query.length() != 0) {
			listUrl = cp + "/lessonPlus/list?" + query;
		}

		String paging = myUtil.paging(current_page, total_page, listUrl);

		model.addAttribute("mainNum", mainNum);
		model.addAttribute("subNum", subNum);
		model.addAttribute("tagNum", tagNum);
		model.addAttribute("list", list);
		model.addAttribute("listMainCategory", listMainCategory);
		model.addAttribute("page", current_page);
		model.addAttribute("dataCount", dataCount);
		model.addAttribute("size", size);
		model.addAttribute("total_page", total_page);
		model.addAttribute("paging", paging);
		model.addAttribute("listUrl", listUrl);
		model.addAttribute("schType", schType);
		model.addAttribute("kwd", kwd);

		return ".pluszone.lesson.list";
	}

	@GetMapping("listSubCategory")
	@ResponseBody
	public Map<String, Object> listSubCategory(@RequestParam long mainNum) {
		Map<String, Object> model = new HashMap<String, Object>();
		List<LessonPlus> listSubCategory = service.listSubCategory(mainNum);
		model.put("listSubCategory", listSubCategory);
		return model;
	}

	@GetMapping("write")
	public String writeForm(Model model) {
		List<LessonPlus> listMainCategory = service.listMainCategory();
		List<LessonPlus> listHashTag = service.listHashTag();
		List<LessonPlus> listSubCategory = null;
		long mainNum = 0;
		if (listMainCategory.size() != 0) {
			mainNum = listMainCategory.get(0).getMainNum();
		}
		listSubCategory = service.listSubCategory(mainNum);

		model.addAttribute("listHashTag", listHashTag);
		model.addAttribute("mode", "write");
		model.addAttribute("listMainCategory", listMainCategory);
		model.addAttribute("listSubCategory", listSubCategory);

		return ".pluszone.lesson.write";
	}

	@PostMapping("write")
	public String writeSubmit(LessonPlus dto, HttpSession session, Model model) {
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		dto.setMemberIdx(info.getMemberIdx());
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "lesson";
		
		try {
			dto.setSpecial(0);
			service.insertLesson(dto, path);
		} catch (Exception e) {
		}
		
		
		return "redirect:/pluszone/lessonPlus/main";
	}

	@GetMapping("update")
	public String updateForm(@RequestParam long classNum, Model model, @RequestParam String page) {
		
		LessonPlus dto = service.findById(classNum);
		if(dto == null) {
			String query = "page=" + page;
			return "redirect:/lessonPlus/main?" + query;
		}
		
		List<LessonPlus> listPhoto = service.listLessonPhoto(classNum);
		List<LessonPlus> listDetail = service.findByDetail(classNum);
		
		long mainNum = dto.getMainNum();
		
		String dC = "";
		
		for(LessonPlus vo : listDetail) {
			dC = vo.getdContent();
			dto.setdContent(dC);
		}
		
		List<LessonPlus> listMainCategory = service.listMainCategory();
		List<LessonPlus> listSubCategory = service.listSubCategory(dto.getMainNum());
		List<LessonPlus> listHashTag = service.listHashTag();
		
		for(LessonPlus lp : listDetail) {
			model.addAttribute("detailNum", lp.getDetailNum());
		}

		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);
		model.addAttribute("listPhoto", listPhoto);
		model.addAttribute("listMainCategory", listMainCategory);
		model.addAttribute("listSubCategory", listSubCategory);
		model.addAttribute("page", page);
		model.addAttribute("listHashTag", listHashTag);
		model.addAttribute("mainNum", mainNum);
		model.addAttribute("listDetail", listDetail);
		
		return ".pluszone.lesson.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(LessonPlus dto, @RequestParam String page, HttpSession session, Model model,
			@RequestParam(name = "detailValues") String detailValues, @RequestParam(name = "countValues") String countValues) throws Exception{
		
		String root = session.getServletContext().getRealPath("/");
		String path = root + "uploads" + File.separator + "lesson";
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			service.updateLesson(dto, path);
			
			String detailNum[] = detailValues.split(" ");
			String count[] = countValues.split(" ");
			
			for(int i = 0; i < detailNum.length; i++) {
				map.put("detailNum", detailNum[i]);
				map.put("count", count[i]);
				map.put("dContent", dto.getdContent());
				service.updateLessonDetail(map);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
		String query = "page=" + page;
		return "redirect:/pluszone/lessonPlus/main?" + query;
	}
	
	@PostMapping("deleteFile")
	@ResponseBody
	public Map<String, Object> deleteFile(@RequestParam long photoNum, @RequestParam String photoName, HttpSession session) throws Exception{
		String state = "true";
		try {
			String root = session.getServletContext().getRealPath("/");
			String pathname = root + "uploads" + File.separator + "lesson" + File.separator + photoName;
			service.deleteLessonPhoto(photoNum, pathname);
			
		} catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		return model;
	}
	
	@GetMapping("delete")
	public String deleteLesson(@RequestParam long classNum) {
		try {
			service.deleteLesson(classNum);
		} catch (Exception e) {
		}
		return "redirect:/pluszone/lessonPlus/main";
	}
}
