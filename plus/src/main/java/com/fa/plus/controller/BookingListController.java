package com.fa.plus.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.domain.BookingList;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.BookingListService;

@Controller
@RequestMapping("/bookingList/*")
public class BookingListController {

	@Autowired
	private BookingListService service;
	
	@RequestMapping("bLists")
	public String list(
				  HttpSession session
				, Model model) throws Exception{
		List<BookingList> list = new ArrayList<BookingList>();
		List<BookingList> rtnList = new ArrayList<BookingList>();
		BookingList paramDto = new BookingList();
		BookingList rtnDto = new BookingList();
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			paramDto.setUserId(info.getUserId());
			if(paramDto.getUserId() != null && !"".equals(paramDto.getUserId())) {
				list = service.findByOrderNum(paramDto.getUserId());
			}

			for(BookingList book : list) {
				paramDto.setOrderNum(book.getOrderNum());
				paramDto.setRnum(book.getRnum());
				rtnDto = service.findByClassNum(book.getOrderNum());
				paramDto.setState(rtnDto.getState());
				rtnDto = service.classInfo(rtnDto.getClassNum());
				
				if(paramDto.getState() == 0) {
					paramDto.setMode("예약대기");
				}else if(paramDto.getState() == 1) {
					paramDto.setMode("예약확정");
				}else{
					paramDto.setMode("환불");
				}
				
				rtnDto.setOrderNum(paramDto.getOrderNum());
				rtnDto.setRnum(paramDto.getRnum());
				rtnDto.setState(paramDto.getState());
				rtnDto.setMode(paramDto.getMode());
				
				rtnList.add(rtnDto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("rtnList", rtnList);
		
		return ".myPage.bLists";
	}
	
	@GetMapping("detail")
	@ResponseBody
	public Map<String, Object> detailInfo(
				@RequestParam long orderNum
				, HttpSession session
				, BookingList dto) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			dto.setUserId(info.getUserId());
			
			map.put("userId", dto.getUserId());
			map.put("orderNum", dto.getOrderNum());
			
			dto = service.bookingDetail(map);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("userName", dto.getUserName());
		model.put("cDate", dto.getcDate());
		model.put("count", dto.getCount());
		model.put("className", dto.getClassName());
		model.put("pay", dto.getPay());
		model.put("tel", dto.getTel());
		model.put("email", dto.getEmail());
		
		return model;
	}
}
