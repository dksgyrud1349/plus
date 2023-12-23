package com.fa.plus.controller;

import java.io.File;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.Board;
import com.fa.plus.domain.Reply;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.BoardService;

@Controller
@RequestMapping("/bbs/*")
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private MyUtil myUtil;
	
	
	@RequestMapping(value = "list")
	public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpServletRequest req,
			HttpSession session,
			Model model) throws Exception {

		String cp = req.getContextPath();

		int size = 5;
		int total_page;
		int dataCount;

		if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
			kwd = URLDecoder.decode(kwd, "utf-8");
		}

		// 전체 페이지 수
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);

		dataCount = service.dataCount(map);
		total_page = myUtil.pageCount(dataCount, size);

		if (total_page < current_page) {
			current_page = total_page;
		}

		int offset = (current_page - 1) * size;
		if(offset < 0) offset = 0;

		map.put("offset", offset);
		map.put("size", size);
		
		SessionInfo info = (SessionInfo) session.getAttribute("member");
		// 게시글 좋아요 여부
		map.put("userId", info.getUserId());
		boolean userBoardLiked = service.userBoardLiked(map);
		
		List<Board> list = service.listBoard(map);
		
		String query = "";
		String listUrl = cp + "/bbs/list";
		String articleUrl = cp + "/bbs/article?page=" + current_page;
		if (kwd.length() != 0) {
			query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
		}
		
		if (query.length() != 0) {
			listUrl = cp + "/bbs/list?" + query;
			articleUrl = cp + "/bbs/article?page=" + current_page + "&" + query;
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
			model.addAttribute("userBoardLiked", userBoardLiked);

			return ".bbs.list";
		}
	
	@GetMapping("write")
	public String writeForm(Model model) throws Exception {

		model.addAttribute("mode", "write");

		return ".bbs.write";
	}
	
	@PostMapping("write")
	public String writeSubmit(Board dto, HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "bbs";

		try {
			dto.setUserId(info.getUserId());
			service.insertBoard(dto, pathname);
		} catch (Exception e) {
		}

		return "redirect:/bbs/list";
	}
	
	@GetMapping("article")
	public String article(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session,
			Model model) throws Exception {
		
		kwd = URLDecoder.decode(kwd, "utf-8");

		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + 
					"&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}
		
		service.updateHitCount(num);
		
		Board dto = service.findById(num);
		if (dto == null) {
			return "redirect:/bbs/list?" + query;
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("schType", schType);
		map.put("kwd", kwd);
		map.put("num", num);

		Board prevDto = service.findByPrev(map);
		Board nextDto = service.findByNext(map);

		SessionInfo info = (SessionInfo) session.getAttribute("member");
		// 게시글 좋아요 여부
		map.put("userId", info.getUserId());
		boolean userBoardLiked = service.userBoardLiked(map);
		
		model.addAttribute("dto", dto);
		model.addAttribute("prevDto", prevDto);
		model.addAttribute("nextDto", nextDto);

		model.addAttribute("page", page);
		model.addAttribute("query", query);

		model.addAttribute("userBoardLiked", userBoardLiked);
		
		return ".bbs.article";
	}
	
	@GetMapping("update")
	public String updateForm(@RequestParam long num,
			@RequestParam String page,
			HttpSession session,
			Model model) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		Board dto = service.findById(num);
		if (dto == null || ! info.getUserId().equals(dto.getUserId())) {
			return "redirect:/bbs/list?page=" + page;
		}

		model.addAttribute("dto", dto);
		model.addAttribute("mode", "update");
		model.addAttribute("page", page);

		return ".bbs.write";
	}
	
	@PostMapping("update")
	public String updateSubmit(Board dto,
			@RequestParam String page,
			HttpSession session) throws Exception {

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "bbs";

		try {
			service.updateBoard(dto, pathname);
		} catch (Exception e) {
		}

		return "redirect:/bbs/article?num=" + dto.getNum() + "&page=" + page;
	}
	
	
	@GetMapping("delete")
	public String delete(@RequestParam long num,
			@RequestParam String page,
			@RequestParam(defaultValue = "all") String schType,
			@RequestParam(defaultValue = "") String kwd,
			HttpSession session) throws Exception {
		SessionInfo info = (SessionInfo) session.getAttribute("member");

		kwd = URLDecoder.decode(kwd, "utf-8");
		String query = "page=" + page;
		if (kwd.length() != 0) {
			query += "&schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "UTF-8");
		}

		String root = session.getServletContext().getRealPath("/");
		String pathname = root + "uploads" + File.separator + "bbs";

		service.deleteBoard(num, pathname, info.getUserId(), info.getMembership());

		return "redirect:/bbs/list?" + query;

	}
	
	
	// 게시글 좋아요 추가/삭제 : AJAX-JSON
		@PostMapping("insertBoardLike")
		@ResponseBody
		public Map<String, Object> insertBoardLike(@RequestParam long num, 
				@RequestParam boolean userLiked,
				HttpSession session) {
			String state = "true";
			int boardLikeCount = 0;
			SessionInfo info = (SessionInfo) session.getAttribute("member");

			Map<String, Object> paramMap = new HashMap<>();
			paramMap.put("num", num);
			paramMap.put("userId", info.getUserId());

			try {
				if(userLiked) {
					service.deleteBoardLike(paramMap);
				} else {
					service.insertBoardLike(paramMap);
				}
			} catch (DuplicateKeyException e) {
				state = "liked";
			} catch (Exception e) {
				state = "false";
			}

			boardLikeCount = service.boardLikeCount(num);

			Map<String, Object> model = new HashMap<>();
			model.put("state", state);
			model.put("boardLikeCount", boardLikeCount);

			return model;
		}
		
		
		// 댓글 리스트 : AJAX-TEXT
		@GetMapping("listReply")
		public String listReply(@RequestParam long num, 
				@RequestParam(value = "pageNo", defaultValue = "1") int current_page,
				HttpSession session,
				Model model) throws Exception {

			SessionInfo info = (SessionInfo)session.getAttribute("member");
			
			int size = 5;
			int total_page = 0;
			int dataCount = 0;

			Map<String, Object> map = new HashMap<>();
			map.put("num", num);
			
			map.put("membership", info.getMembership());
			map.put("userId", info.getUserId());
			
			dataCount = service.replyCount(map);
			total_page = myUtil.pageCount(dataCount, size);
			if (current_page > total_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;

			map.put("offset", offset);
			map.put("size", size);
			List<Reply>listReply = service.listReply(map);	
			for (Reply dto : listReply) {
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

			return "bbs/listReply";
		}
		
		// 댓글 및 댓글의 답글 등록 : AJAX-JSON
		@PostMapping("insertReply")
		@ResponseBody
		public Map<String, Object> insertReply(Reply dto, HttpSession session) {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			String state = "true";

			try {
				dto.setUserId(info.getUserId());
				service.insertReply(dto);
			} catch (Exception e) {
				state = "false";
			}

			Map<String, Object> model = new HashMap<>();
			model.put("state", state);
			return model;
		}
		
		// 댓글 및 댓글의 답글 삭제 : AJAX-JSON
		@PostMapping("deleteReply")
		@ResponseBody
		public Map<String, Object> deleteReply(@RequestParam Map<String, Object> paramMap) {
			String state = "true";
			
			try {
				service.deleteReply(paramMap);
			} catch (Exception e) {
				state = "false";
			}

			Map<String, Object> map = new HashMap<>();
			map.put("state", state);
			return map;
		}
		
		@PostMapping("insertReplyLike")
		@ResponseBody
		public Map<String, Object> insertReplyLike(@RequestParam Map<String, Object> paramMap,
				HttpSession session) {
			String state = "true";

			SessionInfo info = (SessionInfo) session.getAttribute("member");
			Map<String, Object> model = new HashMap<>();

			try {
				paramMap.put("userId", info.getUserId());
				service.insertReplyLike(paramMap);
			} catch (DuplicateKeyException e) {
				state = "liked";
			} catch (Exception e) {
				state = "false";
			}
			
			Map<String, Object> countMap = service.replyLikeCount(paramMap);

			// 마이바티스의 resultType이 map인 경우 int는 BigDecimal로 넘어옴
			int likeCount = ((BigDecimal) countMap.get("LIKECOUNT")).intValue();
			
			model.put("likeCount", likeCount);
			model.put("state", state);
			return model;
		}
		
		// 댓글 숨김/표시 추가 : AJAX-JSON
		@PostMapping("replyShowHide")
		@ResponseBody
		public Map<String, Object> replyShowHide(@RequestParam Map<String, Object> paramMap,
				HttpSession session) {
			String state = "true";

			SessionInfo info = (SessionInfo) session.getAttribute("member");

			try {
				paramMap.put("userId", info.getUserId());
				service.updateReplyShowHide(paramMap);
			} catch (Exception e) {
				state = "false";
			}

			Map<String, Object> model = new HashMap<>();
			model.put("state", state);
			return model;
		}
	
	
}
