package com.fa.plus.controller;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fa.plus.common.MyUtil;
import com.fa.plus.domain.Board;
import com.fa.plus.domain.BookingList;
import com.fa.plus.domain.Lesson;
import com.fa.plus.domain.MyWishList;
import com.fa.plus.domain.PlusAns;
import com.fa.plus.domain.PlusQ;
import com.fa.plus.domain.SessionInfo;
import com.fa.plus.service.BoardService;
import com.fa.plus.service.BookingListService;
import com.fa.plus.service.MileageListService;
import com.fa.plus.service.MyWishListService;
import com.fa.plus.service.OnedayplusService;
import com.fa.plus.service.ReviewService;

@Controller
@RequestMapping("/myPage/*")
public class MyPageController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MyUtil myUtil;
	
	@Autowired
	private BookingListService bookingListSerivce;
	
	@Autowired
	private OnedayplusService onedayService;
	
	// 적립금
	@Autowired
	private MileageListService mileageListService;
	
	// 리뷰
	@Autowired
	private ReviewService reviewService;
	
	// 위시리스트
	@Autowired
	private MyWishListService myWishListService;
	
	@RequestMapping(value = "main")
	public String main(HttpSession session, Model model) {
		
		SessionInfo info = (SessionInfo)session.getAttribute("member");
		if(info == null) {
			return "redirect:/member/login";
		}
		BookingList paramDto = new BookingList();
		BookingList rtnDto = new BookingList();
		List<BookingList> orderNumList = new ArrayList<BookingList>();
		List<BookingList> rtnList = new ArrayList<BookingList>();
		try {
			
			paramDto.setUserId(info.getUserId());
			
			// userId가 존재해야 if문 조건 참
			if(paramDto.getUserId() != null && !"".equals(paramDto.getUserId())) {
				// userId가 신청한 orderNum 전부 가져오기
				orderNumList = bookingListSerivce.findByOrderNum(paramDto.getUserId());
			}
			
			for(BookingList book : orderNumList) {
				paramDto.setOrderNum(book.getOrderNum());
				paramDto.setRnum(book.getRnum());
				// 주문한 classNum 가져오기
				rtnDto = bookingListSerivce.findByClassNum(book.getOrderNum());
				
				paramDto.setState(rtnDto.getState());
				// classNum과 관련된 클래스 정보 가져오기
				rtnDto = bookingListSerivce.classInfo(rtnDto.getClassNum());
				
				// state 조건문
				if(paramDto.getState() == 0) {
					paramDto.setMode("예약대기");
				}else if(paramDto.getState() == 1) {
					paramDto.setMode("예약확정");
				}else {
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
		
		// 적립금
		int mileage = mileageListService.findByMyMileage(info.getUserId());
		model.addAttribute("mileage", mileage);
		
		// 예약 건수
		int bookCount = bookingListSerivce.bookCount(info.getMemberIdx());
		model.addAttribute("bookCount", bookCount);
		
		// 리뷰 개수
		int reviewCount = reviewService.reviewCount(info.getMemberIdx());
		model.addAttribute("reviewCount", reviewCount);
		
		// 위시리스트
		List<MyWishList> wishlist = myWishListService.wishList(info.getUserId());
		model.addAttribute("wishList", wishlist);
		
		return ".myPage.main";
	}
	
	
	// 마이페이지-리뷰
		@GetMapping("review")
		public String review(
				@RequestParam(defaultValue = "review") String mode,
				HttpSession session,
				Model model) throws Exception {
			SessionInfo info = (SessionInfo)session.getAttribute("member");
			if(info == null) {
				return "redirect:/member/login";
			}
			model.addAttribute("mode", mode);
			return ".myPage.review";
		}
	
		@RequestMapping(value = "mybbs")
		public String list(@RequestParam(value = "page", defaultValue = "1") int current_page,
				@RequestParam(defaultValue = "all") String schType,
				@RequestParam(defaultValue = "") String kwd,
				HttpServletRequest req,
				HttpSession session,
				Model model) throws Exception {

			SessionInfo info = (SessionInfo) session.getAttribute("member");

			String cp = req.getContextPath();
			int size = 5;
			int total_page;
			int dataCount;

			if (req.getMethod().equalsIgnoreCase("GET")) { // GET 방식인 경우
				kwd = URLDecoder.decode(kwd, "utf-8");
			}

			// 전체 페이지 수
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("myId", info.getUserId());
			map.put("schType", schType);
			map.put("kwd", kwd);
			
			dataCount = boardService.dataCount(map);

			total_page = myUtil.pageCount(dataCount, size);

			if (total_page < current_page) {
				current_page = total_page;
			}

			int offset = (current_page - 1) * size;
			if(offset < 0) offset = 0;

			map.put("offset", offset);
			map.put("size", size);
			List<Board> list = boardService.listBoard(map);
			
			for(Board dto : list) {
				List<String> imgs = myUtil.getImgSrc(dto.getContent());
				if(imgs.size() > 0) {
					dto.setImageFilename(imgs.get(0));
				} else {
					dto.setImageFilename(cp + "/resources/images/Image-folder.jpg");
				}
			}		
			
			String query = "";
			String listUrl = cp + "/myBbs/list";
			String articleUrl = cp + "/bbs/article?page=" + current_page;
			if (kwd.length() != 0) {
				query = "schType=" + schType + "&kwd=" + URLEncoder.encode(kwd, "utf-8");
			}
			
			if (query.length() != 0) {
				listUrl = cp + "/myBbs/list?" + query;
				articleUrl = cp + "/bbs/article?page=" + current_page + "&" + query;
			}
			String paging = myUtil.paging(current_page, total_page, listUrl);
			
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("dataCount", dataCount);
			model.addAttribute("size", size);
			model.addAttribute("total_page", total_page);
			model.addAttribute("articleUrl", articleUrl);
			model.addAttribute("page", current_page);
			model.addAttribute("paging", paging);

			model.addAttribute("schType", schType);
			model.addAttribute("kwd", kwd);
			
			model.addAttribute("list", list);

			return ".myPage.mybbs";
		}
	
		@GetMapping("onedayplus")
		public String result(HttpSession session,
				Model model) throws Exception {
			SessionInfo info = (SessionInfo) session.getAttribute("member");
			String userId = info.getUserId();
			// 질문 제목
			List<PlusQ> qlist = onedayService.QSubject();
			
			// 결과지 내용
			List<PlusAns> list = onedayService.listAnswer(userId);
			
			int answerCount = onedayService.answerCount(userId);
			
			if(answerCount != 0) {
				Map<String, Object> map = new HashMap<String, Object>();
				String purpose = onedayService.resultPurpose(userId);
				String category = onedayService.resultCategory(userId);
				String location = onedayService.resultLocation(userId);
				long classprice = onedayService.resultPrice(userId);
				
				map.put("purpose", purpose);
				map.put("category", category);
				map.put("location", location);
				map.put("classprice", classprice);
				map.put("userId", userId);

				List<Lesson> classList = onedayService.resultClass(map);
				int resultCount = onedayService.resultCount(map);
				
				model.addAttribute("classList", classList);
				model.addAttribute("resultCount", resultCount);
			}
			
			model.addAttribute("qlist", qlist);
			model.addAttribute("list", list);
			model.addAttribute("userId", userId);
			model.addAttribute("answerCount", answerCount);
			
			return ".myPage.onedayplus";
		}
	
}
