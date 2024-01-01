package com.fa.plus.pluszone.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.domain.SessionInfo;
import com.fa.plus.pluszone.domain.PlusSchedule;
import com.fa.plus.pluszone.service.PlusScheduleService;

@Controller
@RequestMapping("/pluszone/schedule/*")
public class PlusScheduleController {

	@Autowired
	private PlusScheduleService service;
	
	@RequestMapping("main")
	public String main(
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		List<PlusSchedule> listCategory = service.listCategory(map);
		
		model.addAttribute("listCategory", listCategory);
		return ".pluszone.schedule.main";
	}
	@GetMapping("write")
	public String writeForm(@ModelAttribute(value = "dto") PlusSchedule dto,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		List<PlusSchedule> listCategory = service.listCategory(map);
		
		model.addAttribute("mode", "write");
		model.addAttribute("listCategory", listCategory);
		
		return ".pluszone.schedule.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(PlusSchedule dto,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			if(dto.getcNum() == 0) {
				dto.setcNum(null);
			}
			
			dto.setUserId(info.getUserId());
			service.insertSchedule(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/pluszone/schedule/main";
	}
	
	// 월별 일정 - AJAX : JSON 
	@GetMapping(value="month")
	@ResponseBody
	public Map<String, Object> month (
			@RequestParam String start,
			@RequestParam String end,
			@RequestParam(required = false) List<Integer> categorys,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("categoryList", categorys);
		map.put("start", start);
		map.put("end", end);
		map.put("userId", info.getUserId());
		
		List<PlusSchedule> list = service.listMonth(map);
		for(PlusSchedule dto:list) {
	    	if(dto.getsTime()==null) {
	    		dto.setAll_Day(true);
	    	} else {
	    		dto.setAll_Day(false);
	    	}
	    	
	    	if(dto.getsTime()!=null && dto.getsTime().length()!=0) {
	    		// 2021-10-10T10:10
	    		dto.setStart(dto.getsDay()+"T" + dto.getsTime());
	    	} else {
	    		dto.setStart(dto.getsDay());
	    	}
	    	
	    	if(dto.geteTime()!=null && dto.geteTime().length()!=0) {
	    		dto.setEnd(dto.geteDay()+"T" + dto.geteTime());
	    	} else {
	    		dto.setEnd(dto.geteDay());
	    	}
	    		    	
		}
		
		Map<String, Object> model=new HashMap<>();
		model.put("list", list);
		return model;
	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam int sNum,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		
		PlusSchedule dto = service.findById(sNum);
		if(dto == null) {
			return "redirect:/pluszone/schedule/main";
		}
		
		if(dto.getsTime() == null) {
			dto.setAllDay("1");
			try {
				String s = dto.geteDay().replaceAll("\\-|\\.|/", "");

				int y = Integer.parseInt(s.substring(0, 4));
				int m = Integer.parseInt(s.substring(4, 6));
				int d = Integer.parseInt(s.substring(6));

				Calendar cal = Calendar.getInstance();
				cal.set(y, m - 1, d);

				cal.add(Calendar.DATE, -1);

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				dto.seteDay(sdf.format(cal.getTime()));
			} catch (Exception e) {
			}
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", info.getUserId());
		List<PlusSchedule> listCategory = service.listCategory(map);
		
		model.addAttribute("mode", "update");
		model.addAttribute("dto", dto);
		model.addAttribute("listCategory", listCategory);
		
		return ".pluszone.schedule.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(PlusSchedule dto,
			HttpSession session) throws Exception {
		SessionInfo info=(SessionInfo)session.getAttribute("member");
		
		try {
			if(dto.getcNum() == 0) {
				dto.setcNum(null);
			}
			
			dto.setUserId(info.getUserId());
			service.updateSchedule(dto);
		} catch (Exception e) {
		}
		
		return "redirect:/pluszone/schedule/main";
	}

	// 일정을 드래그 한 경우 수정 완료 - AJAX : JSON
	@PostMapping("updateDrag")
	@ResponseBody
	public Map<String, Object> updateDragSubmit(PlusSchedule dto, HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String state = "true";
		try {
			dto.setUserId(info.getUserId());
			if(dto.getcNum() == 0) {
				dto.setcNum(null);
			}
			
			service.updateSchedule(dto);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
	// 일정 삭제 - AJAX : JSON
	@PostMapping("delete")
	@ResponseBody
	public Map<String, Object> delete(
			@RequestParam int num,
			HttpSession session
			) {
		SessionInfo info=(SessionInfo)session.getAttribute("member");

		String state = "true";
		try {
			Map<String, Object> map=new HashMap<>();
			map.put("userId", info.getUserId());
			map.put("num", num);
			service.deleteSchedule(map);
		}catch (Exception e) {
			state = "false";
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("state", state);
		
		return model;
	}
	
	// 카테고리 등록 - AJAX : JSON
	@PostMapping("categoryAdd")
	@ResponseBody
	public Map<String, Object> categoryAdd(@RequestParam Map<String, Object> paramMap,
				HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String state = "true";
		List<PlusSchedule> listCategory = null;
		try {
			paramMap.put("userId", info.getUserId());
			service.insertSchCategory(paramMap);
			
			listCategory = service.listCategory(paramMap);
			
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		model.put("listCategory", listCategory);
		return model;
	}
	
	// 카테고리 삭제 - AJAX : JSON
	@PostMapping("categoryDelete")
	@ResponseBody
	public Map<String, Object> categoryDelete(@RequestParam Map<String, Object> paramMap,
				HttpSession session) {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String state = "true";
		try {
			paramMap.put("userId", info.getUserId());
			service.deleteSchCategory(paramMap);
		} catch (Exception e) {
			state = "false";
		}

		Map<String, Object> model = new HashMap<>();
		model.put("state", state);
		return model;
	}
	
}
