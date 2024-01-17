package com.fa.plus.chatting;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.websocket.CloseReason;
import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.chatting.mongodb.MessageService;
import com.fa.plus.chatting.mongodb.UserMessage;
import com.fa.plus.chatting.mongodb.UserRoom;


@Service
@ServerEndpoint(value = "/channel/{path-name}", configurator = ServerEndpointConfigurator.class)
public class MessageHandler {
	private static final Logger logger = LoggerFactory.getLogger(MessageHandler.class);
	
	// static 이어야 함. 클라이언트가 접속 할 때 마다 MessageHandler 객체가 생성되고 관리된다.
	private static Map<String, ConnectUser> userSession = new Hashtable<>();
	private static Map<String, ConnectAdmin> adminSession = new Hashtable<>();
	// private static Map<String, ConnectUser> userSession = Collections.synchronizedMap(new HashMap<>());
	
	@Autowired
	private MessageService messageService;
	
	@OnOpen
    public void open(Session session, EndpointConfig config, @PathParam("path-name") String pathName) {
		logger.info("client connect ...");
		
		// HttpSession httpSession = (HttpSession)config.getUserProperties().get(HttpSession.class.getName());		
    }
	
	// Text 메시지를 받는 경우
	@OnMessage
    public void onMessage(Session session, String message, @PathParam("path-name") String pathName) {
		// pathName : user, manage
		
		if(pathName.equals("user")) { // 일반 유저
			userService(session, message);
		} else if(pathName.equals("manage")) { // 관리자
			adminService(session, message);
		}

	}
	
	@OnClose
    public void close(Session session, CloseReason reason, @PathParam("path-name") String pathName) {
		if(pathName.equals("user")) { // 일반 유저
			removeUser(session);
		} else if(pathName.equals("manage")) { // 관리자
			removeAdmin(session);
		}
		
		logger.info("client disConnect : "+ reason.getReasonPhrase());
    }

    @OnError
    public void error(Session session, Throwable t, @PathParam("path-name") String pathName) {
    	t.printStackTrace();
    }
    
    protected void userService(Session session, String message) {
    	// 클라이언트 영역
		JSONObject jsonReceive = null;
		
		try {
			jsonReceive = new JSONObject(message);
			
			String type = jsonReceive.getString("type");
			if (type == null || type.equals("")) {
				return;
			}
			
			if (type.equals("connect")) {
				// 채팅 창에 접속한 경우
				userConnect(session, jsonReceive);
			} else if(type.equals("question")) {
				// 문의를 한 경우
				userQuestion(session, jsonReceive);
			} else if(type.equals("notice")) {
				// 공지사항을 확인하는 경우
				listNotice(session, jsonReceive);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

    protected void adminService(Session session, String message) {
    	// 관리자 영역
		JSONObject jsonReceive = null;

		try {
			jsonReceive = new JSONObject(message);

			String type = jsonReceive.getString("type");
			if (type == null || type.equals("")) {
				return;
			}
			
			if (type.equals("online")) {
				// 관리자 - 온라인 상태로 변경한 경우
				adminOnline(session, jsonReceive);
			} else if(type.equals("answer")) {
				// 관리자 - 답변을 등록 한 경우
				adminAnswer(session, jsonReceive);
			} else if(type.equals("onlineQuestionUsers")) {
				// 온라인 유저 중 질문사항이 있는 유저 리스트
				onlineQuestionUsers(session, jsonReceive);
			} else if(type.equals("onlineAllUsers")) {
				// 온라인 모든 유저 리스트
				onlineAllUsers(session, jsonReceive);
			} else if(type.equals("startChatting")) {
				// 유저와 채팅을 시작하는 경우
				adminUserStartChatting(session, jsonReceive);
			} else if(type.equals("endChatting")) {
				// 유저와 채팅을 종료한 경우
				adminUserEndChatting(session, jsonReceive);
			} else if(type.equals("alarm")) {
				// 알림
				alarm(session, jsonReceive);
			} else if(type.equals("notice")) {
				// 공지사항을 확인하는 경우
				listNotice(session, jsonReceive);
			} else if(type.equals("addNotice")) {
				// 공지사항 등록
				addNotice(session, jsonReceive);
			} else if(type.equals("deleteNotice")) {
				// 공지사항 삭제
				deleteNotice(session, jsonReceive);
			} else if(type.equals("offline")) {
				// offline 상태로 변경 한 경우
				adminOffline(session, jsonReceive);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    // 유저 - 채팅창에 접속한 경우
    protected void userConnect(Session session, JSONObject jsonReceive) {
    	try {
    		// 접속한 사용자의 아이디를 키로 session과 유저 정보를 Map에 저장 
    		String uidx = jsonReceive.getString("uidx");
    		String nickName = jsonReceive.getString("nickName");
    		String userId = jsonReceive.getString("userId");
    		
    		if(uidx == null || uidx.length() == 0 || nickName == null || nickName.length() < 2 || userId == null || userId.length() < 3) {
    			return;
    		}

    		ConnectUser connUser = new ConnectUser();
    		connUser.setUidx(uidx);
    		connUser.setUserId(userId);
    		connUser.setUserName(nickName);
    		connUser.setSession(session);

    		userSession.put(uidx, connUser);
    		
    		// 유저의 최근 5일 이내의 메시지중 답변을 읽은 상태로 변경하고 메시지를 전송
    		JSONObject jsonSend = new JSONObject();
    		jsonSend.put("type", "connectOk");

    		Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 M월 d일 E요일");
			String date = sdf.format(now);
			String fullDate = sdf2.format(now);
    		jsonSend.put("nowDate", date);
    		jsonSend.put("nowFullDate", fullDate);
    		
    		List<UserMessage> listUserMessage = messageService.listUserMessage(uidx, uidx, 1);
    		JSONArray arrMsg = new JSONArray();

    		for(UserMessage msg : listUserMessage) {
    			JSONObject job = new JSONObject();
    			
   				job.put("fromIdx", msg.getFromIdx());
   				job.put("fromName", msg.getFromName());
   				job.put("classify", msg.getClassify());
   				job.put("toIdx", msg.getToIdx());
   				job.put("toName", msg.getToName());
   				job.put("content", msg.getContent());
   				job.put("readIdx", msg.getReadIdx());
   				job.put("date", msg.getDate());
   				job.put("dateWeek", msg.getDateWeek());
   				job.put("time", msg.getTime());
    			
    			arrMsg.put(job);
    		}
	    		
    		jsonSend.put("messageList", arrMsg);
    		
    		// 관리자가 온라인 상태이면 실시간 상담 가능 여부를 전송 : 실시간 상담이 가능합니다. 문의를 하시면 문의 순서대로 빠르게 답변해 드리겠습니다. 
    		if(adminSession.size() > 0) {
    			jsonSend.put("realTime", 1);
    		} else {
    			jsonSend.put("realTime", 0);
    		}
    		
    		sendTextMessageToOne(jsonSend.toString(), session);
    		
    		// 관리자에게 유저의 connect 사실을 알림
    		JSONObject jsonSend2 = new JSONObject();
    		jsonSend2.put("type", "userConn");
    		jsonSend2.put("roomIdx", uidx);
    		jsonSend2.put("userId", userId);
    		jsonSend2.put("userName", nickName);
    		
    		sendMessageToAdminAll(jsonSend2.toString(), null);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
    }
    
    // 유저 - 문의를 한 경우
    protected void userQuestion(Session session, JSONObject jsonReceive) {
    	try {
    		ConnectUser user = getConnectionUser(session);
    		if(user == null) {
    			return;
    		}
    		
    		String inquiry = jsonReceive.getString("inquiry");
    		
    		UserMessage msg = new UserMessage();
    		
    		msg.setFromIdx(user.getUidx());
    		msg.setFromName(user.getUserName());
    		msg.setClassify(1);
    		msg.setRoomIdx(user.getUidx());
    		msg.setContent(inquiry);
    		
    		// 문의 사항을 몽고디비에 저장
    		messageService.insertUserMessage(msg, user.getUserId());
    		
			// 관리자에게 메시지 전송
    		int unread = 1;
    		if(user.getAidx() != null) {
    			// 관리자와 채팅 상태이면 관리자에게 문의 사항 전송 및 읽은 상태로 변경
    			ConnectAdmin admin = adminSession.get(user.getAidx());
    			
    			if(admin != null) {
	    			// 메시지를 읽은 상태로 변경
    				messageService.updateUserMessageRead(msg.getMsgId().toString(), user.getAidx());
    				// 룸을 답변 완료로 변경
    				messageService.updateUserRoomQuestion(msg.getRoomIdx(), 0);
    				unread = 0;
	   				
    	    		JSONObject jsonSend = new JSONObject();
    	    		jsonSend.put("type", "inquiry");
    	    		
    				JSONObject job = new JSONObject();
    				job.put("fromIdx", msg.getFromIdx());
    				job.put("fromName", msg.getFromName());
    				job.put("classify", msg.getClassify());
    				job.put("content", msg.getContent());
    				job.put("date", msg.getDate());
    				job.put("dateWeek", msg.getDateWeek());
    				job.put("time", msg.getTime());
    				
    				jsonSend.put("msg", job);
	   				sendTextMessageToOne(jsonSend.toString(), admin.getSession());
    			} 
    		} else {
    			// 관리자와 채팅 상태가 아니면, 접속한 모든 관리자에게 유저의 메시지 전송
	    		JSONObject jsonSend = new JSONObject();
	    		jsonSend.put("type", "roomInquiry");
	    		
				JSONObject job = new JSONObject();
				
	    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd a h:m");
				String date = sdf.format(msg.getSendDate());
   				job.put("roomIdx", msg.getRoomIdx());
   				job.put("userId", user.getUserId());
   				job.put("userName", user.getUserName());
   				job.put("question", 1);
   				job.put("content", msg.getContent());
   				job.put("dateTime", date);
   				
    			jsonSend.put("userRoom", job);

    			sendMessageToAdminAll(jsonSend.toString(), null);
    		}
    		
    		// 유저에게 메시지 등록 상태 전송
    		JSONObject jsonSend2 = new JSONObject();
    		jsonSend2.put("type", "inquiryOk");
    		jsonSend2.put("unread", unread);
    		
    		sendTextMessageToOne(jsonSend2.toString(), session);
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    }
   
    // 관리자 - 온라인 상태인 경우
    protected void adminOnline(Session session, JSONObject jsonReceive) {
    	try {
    		// 접속한 사용자의 아이디를 키로 session과 유저 정보를 Map에 저장 
        	String aidx = jsonReceive.getString("aidx");
    		String nickName = jsonReceive.getString("nickName");

    		ConnectAdmin connAdmin = new ConnectAdmin();
    		connAdmin.setAidx(aidx);
    		connAdmin.setAdminName(nickName);
    		connAdmin.setSession(session);

    		adminSession.put(aidx, connAdmin);
    		
    		// 온라인 유저중 문의가 있는 채팅방 및 답변을 해야 할 오프라인 유저 채팅방 전송
    		String []uIdxs = userSession.keySet().toArray(new String[0]); // 0은 배열의 크기를 자동으로 설정
    		
    		List<UserRoom> listOnline = messageService.listOnlineQuestionUserRoom(uIdxs);
    		List<UserRoom> listOffline = messageService.listOfflineUserRoom(uIdxs);
    		
    		JSONObject jsonSend = new JSONObject();
    		jsonSend.put("type", "onlineOk");
    		
    		JSONArray arrMsg = new JSONArray();

    		for(UserRoom room : listOnline) {
    			JSONObject job = new JSONObject();
    			
   				job.put("roomIdx", room.getRoomIdx());
   				job.put("userId", room.getUserId());
   				job.put("userName", room.getUserName());
   				job.put("question", room.getQuestion());
   				job.put("content", room.getContent());
   				job.put("dateTime", room.getDate());
   				job.put("consulting", getConsultingAdmin(room.getRoomIdx()) == null ? 0 : 1);
    			
    			arrMsg.put(job);
    		}

	    	jsonSend.put("listOnline", arrMsg);
    		
    		arrMsg = new JSONArray();

    		for(UserRoom room : listOffline) {
    			JSONObject job = new JSONObject();
    			
   				job.put("roomIdx", room.getRoomIdx());
   				job.put("userId", room.getUserId());
   				job.put("userName", room.getUserName());
   				job.put("question", room.getQuestion());
   				job.put("content", room.getContent());
   				job.put("dateTime", room.getDate());
   				job.put("consulting", getConsultingAdmin(room.getRoomIdx()) == null ? 0 : 1);
    			
    			arrMsg.put(job);
    		}

    		jsonSend.put("listOffline", arrMsg);

    		sendTextMessageToOne(jsonSend.toString(), session);
        	
    		// 온라인 유저에게 실시간 상담 가능 상태를 알림
    		JSONObject jsonSend2 = new JSONObject();
    		jsonSend2.put("type", "consult");
    		jsonSend2.put("state", 1);
    		sendMessageToUserAll(jsonSend2.toString(), null);
    		
		} catch (Exception e) {
			e.printStackTrace();
		}    	
    }
    
    // 관리자 - 문의에 대한 답변
    protected void adminAnswer(Session session, JSONObject jsonReceive) {
    	try {
    		ConnectAdmin admin = getConnectionAdmin(session);
    		if(admin == null) {
    			return;
    		}
    		
    		String uidx = jsonReceive.getString("roomIdx");
    		String userName = jsonReceive.getString("userName");
    		String answer = jsonReceive.getString("answer");
    		
    		UserMessage msg = new UserMessage();
    		
    		msg.setFromIdx(admin.getAidx());
    		msg.setFromName(admin.getAdminName());
    		msg.setClassify(2);
    		msg.setRoomIdx(uidx);
    		msg.setToIdx(uidx);
    		msg.setToName(userName);
    		msg.setContent(answer);
    		
    		ConnectUser connUser = userSession.get(uidx);
    		String userId = connUser == null ? null : connUser.getUserId();

			// 답변 사항을 몽고 디비에 저장
    		messageService.insertUserMessage(msg, userId);
    		
    		// 룸을 답변 완료로 변경
			messageService.updateUserRoomQuestion(msg.getRoomIdx(), 0);
			
    		// 관리자와 유저가 채팅중인 상태이면 유저에게 답변 전송 및 읽은 상태로 변경
			int unread = 1;
			if(admin.getUidx().equals(uidx)) {
				ConnectUser user = userSession.get(uidx);
				
				if(user == null) {
					return;
				}
				unread = 0;
				
				JSONObject jsonSend = new JSONObject();
	    		jsonSend.put("type", "answerOk");
				
				JSONObject job = new JSONObject();
   				job.put("fromIdx", msg.getFromIdx());
   				job.put("fromName", msg.getFromName());
   				job.put("classify", msg.getClassify());
   				job.put("toIdx", msg.getToIdx());
   				job.put("toName", msg.getToName());
   				job.put("content", msg.getContent());
   				job.put("readIdx", msg.getReadIdx());
   				job.put("date", msg.getDate());
   				job.put("dateWeek", msg.getDateWeek());
   				job.put("time", msg.getTime());
   				
   				jsonSend.put("answer", job);
   				
   				sendTextMessageToOne(jsonSend.toString(), user.getSession());
			}
    		
			// 관리자에게 답변 등록완료 전달
			JSONObject jsonSend2 = new JSONObject();
    		jsonSend2.put("type", "answerOk");
    		jsonSend2.put("unread", unread);
    		sendTextMessageToOne(jsonSend2.toString(), session);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

    // 관리자 - 질문이 있는 온라인 유저룸 전송
    protected void onlineQuestionUsers(Session session, JSONObject jsonReceive) {
    	try {
    		String []uIdxs = userSession.keySet().toArray(new String[0]); // 0은 배열의 크기를 자동으로 설정
    		
    		List<UserRoom> listOnline = messageService.listOnlineQuestionUserRoom(uIdxs);
    		
    		JSONObject jsonSend = new JSONObject();
    		jsonSend.put("type", "onlineQuestionUsers");
    		
    		JSONArray arrMsg = new JSONArray();

    		for(UserRoom msg : listOnline) {
    			JSONObject job = new JSONObject();
    			
   				job.put("roomIdx", msg.getRoomIdx());
   				job.put("userId", msg.getUserId());
   				job.put("userName", msg.getUserName());
   				job.put("question", 1);
   				job.put("content", msg.getContent());
   				job.put("dateTime", msg.getDate());
   				job.put("consulting", getConsultingAdmin(msg.getRoomIdx()) == null ? 0 : 1);
    			
    			arrMsg.put(job);
    		}

    		jsonSend.put("listOnline", arrMsg);
    		
    		sendTextMessageToOne(jsonSend.toString(), session);
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

    // 관리자 - 온라인 모든 유저룸 전송
    protected void onlineAllUsers(Session session, JSONObject jsonReceive) {
    	try {
    		String []uIdxs = userSession.keySet().toArray(new String[0]); // 0은 배열의 크기를 자동으로 설정
    		
    		List<UserRoom> listOnline = messageService.listOnlineUserRoom(uIdxs);
    		
    		JSONObject jsonSend = new JSONObject();
    		jsonSend.put("type", "onlineAllUsers");
    		
    		JSONArray arrMsg = new JSONArray();
    		String []roomIdxs = new String[listOnline.size()];
    		int n = 0;
    		// 룸이 있는 유저
    		for(UserRoom msg : listOnline) {
    			roomIdxs[n++] = msg.getRoomIdx();
    			
    			JSONObject job = new JSONObject();
	    			
   				job.put("roomIdx", msg.getRoomIdx());
   				job.put("userId", msg.getUserId());
   				job.put("userName", msg.getUserName());
   				job.put("question", msg.getQuestion());
   				job.put("content", msg.getContent());
   				job.put("dateTime", msg.getDate());
   				job.put("consulting", getConsultingAdmin(msg.getRoomIdx()) == null ? 0 : 1);
	    			
    			arrMsg.put(job);
    		}

    		// 룸이 없는 유저
    		List<String> roomIdxList = new ArrayList<>(Arrays.asList(roomIdxs));
    		for(String uIdx : uIdxs) {
    			if(! roomIdxList.contains(uIdx)) {
    				ConnectUser connUser = userSession.get(uIdx);
    				
    				JSONObject job = new JSONObject();
	    			
       				job.put("roomIdx", connUser.getUidx());
       				job.put("userId", connUser.getUserId());
       				job.put("userName", connUser.getUserName());
       				job.put("question", "");
       				job.put("content", "");
       				job.put("dateTime", "");
       				job.put("consulting", getConsultingAdmin(connUser.getUidx()) == null ? 0 : 1);

        			arrMsg.put(job);
    			}
    		}
    		jsonSend.put("listOnline", arrMsg);
    		
    		sendTextMessageToOne(jsonSend.toString(), session);
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

    // 관리자 - 유저와 채팅을 시작 하는 경우
    protected void adminUserStartChatting(Session session, JSONObject jsonReceive) {
    	try {
    		ConnectAdmin admin = getConnectionAdmin(session);
    		if(admin == null) {
    			return;
    		}
    		
    		String roomIdx = jsonReceive.getString("roomIdx");
    		String uidx = roomIdx;
    		
    		ConnectAdmin admin2 = getConsultingAdmin(uidx);
    		if(admin2 != null) { // 다른 유저가 상담중이면 채팅 불가
    			JSONObject jsonSend = new JSONObject();
    			jsonSend.put("type", "noChat");
    			jsonSend.put("roomIdx", uidx);
    			
    			sendTextMessageToOne(jsonSend.toString(), session);
    			return;
    		}
    		
    		ConnectUser user = userSession.get(uidx);
    		
    		JSONObject jsonSend = new JSONObject();
    		jsonSend.put("type", "startChatting");
    		if(user == null) {
    			jsonSend.put("userOnline", 0);
    		} else {
    			user.setAidx(admin.getAidx());
    			jsonSend.put("userOnline", 1);
    		}
    		
    		// 유저의 메시지를 관리자에게 전송
    		Date now = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 M월 d일 E요일");
			String date = sdf.format(now);
			String fullDate = sdf2.format(now);
    		jsonSend.put("nowDate", date);
    		jsonSend.put("nowFullDate", fullDate);
    		
    		List<UserMessage> listUserMessage = messageService.listUserMessage(roomIdx);
    		JSONArray arrMsg = new JSONArray();

    		for(UserMessage msg : listUserMessage) {
    			JSONObject job = new JSONObject();
    			
   				job.put("fromIdx", msg.getFromIdx());
   				job.put("fromName", msg.getFromName());
   				job.put("classify", msg.getClassify());
   				job.put("toIdx", msg.getToIdx());
   				job.put("toName", msg.getToName());
   				job.put("content", msg.getContent());
   				job.put("readIdx", msg.getReadIdx());
   				job.put("date", msg.getDate());
   				job.put("dateWeek", msg.getDateWeek());
   				job.put("time", msg.getTime());
    			
    			arrMsg.put(job);
    		}

    		jsonSend.put("messageList", arrMsg);    		
    		
    		sendTextMessageToOne(jsonSend.toString(), session);
    		
    		// 관리자의 상담 유저 변경
    		admin.setUidx(uidx);
    		
    		// 유저에게 실시간 상담 시작을 알림
    		if(user != null) {
    			JSONObject jsonSend2 = new JSONObject();
    			jsonSend2.put("type", "realTimeConsult");
    			jsonSend2.put("adminName", admin.getAdminName());
    			jsonSend2.put("userName", user.getUserName());
    			jsonSend2.put("state", 1);	
    			sendTextMessageToOne(jsonSend2.toString(), user.getSession());
    		}
    		
    		// 다른 관리자에게 유저의 상담 시작을 알림
    		JSONObject jsonSend3 = new JSONObject();
    		jsonSend3.put("type", "userConsulting");
    		jsonSend3.put("roomIdx", uidx);
    		jsonSend3.put("state", 1);
    		jsonSend3.put("question", 0);
    		sendMessageToAdminAll(jsonSend3.toString(), admin.getAidx());
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    // 관리자 - 유저와 채팅을 종료 하는 경우
    protected void adminUserEndChatting(Session session, JSONObject jsonReceive) {
    	try {
    		ConnectAdmin admin = getConnectionAdmin(session);
    		if(admin == null) {
    			return;
    		}
    		
    		String uidx = jsonReceive.getString("roomIdx");
    		
    		// 관리자의 채팅 유저 제거
    		admin.setUidx(null);
    		
    		ConnectUser user = userSession.get(uidx);
    		if(user == null) {
    			return;
    		}
    		user.setAidx(null);

    		// 관리자에게 채팅 종료를 전송
    		UserMessage msg = messageService.lastQuestionUserMessage(uidx);
    		int question = msg == null ? 0 : 1;
    		int online = user == null ? 0 : 1;
    		JSONObject jsonSend = new JSONObject();
    		jsonSend.put("type", "endChatting");
    		jsonSend.put("roomIdx", uidx);
    		jsonSend.put("question", question);
    		jsonSend.put("online", online);
    		sendTextMessageToOne(jsonSend.toString(), session);
    		
    		// 유저에게 실시간 상담 종료를 전송
    		JSONObject jsonSend2 = new JSONObject();
    		jsonSend2.put("type", "realTimeConsult");
    		jsonSend2.put("userName", user.getUserName());
    		jsonSend2.put("state", 0);
    		
    		sendTextMessageToOne(jsonSend2.toString(), user.getSession());
    		
    		// 다른 관리자에게 상담 종료를 알림
    		JSONObject jsonSend3 = new JSONObject();
    		jsonSend3.put("type", "userConsulting");
    		jsonSend3.put("state", 0);
    		jsonSend3.put("question", question);
    		sendMessageToAdminAll(jsonSend3.toString(), admin.getAidx());
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    // 관리자 - 온라인 상태인 경우
    protected void adminOffline(Session session, JSONObject jsonReceive) {
    	try {
    		removeAdmin(session);
    	} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    
    // 유저, 관리자 - 공지사항을 확인하는 경우
    protected void listNotice(Session session, JSONObject jsonReceive) {
    	try {
			// 공지 사항을 요청 유저에게 전송
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    // 관리자 - 공지사항 등록
    protected void addNotice(Session session, JSONObject jsonReceive) {
    	try {
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    }

    // 관리자 - 공지사항 삭제
    protected void deleteNotice(Session session, JSONObject jsonReceive) {
    	try {
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    // 관리자 - 알림
    protected void alarm(Session session, JSONObject jsonReceive) {
    	try {
			// 접속한 모든 유저에게 알림 사항을 전송
    		
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    
	// 접속한 모든 관리자, 유저에게 텍스트 전송
    /**
     * @param message	전송할 메시지
     * @param exclude	제외할 사람. null 이면 전체
     */
	protected void sendMessageToAll(String message, String exclude) {
		sendMessageToUserAll(message, exclude);
		sendMessageToAdminAll(message, exclude);
	}

	// 접속한 모든 유저에게 텍스트 전송
	protected void sendMessageToUserAll(String message, String exclude) {
		Iterator<String> it = userSession.keySet().iterator();
		while (it.hasNext()) {
			String key = it.next();
			if ( exclude != null && exclude == key )  {
			
				continue;
			}
			ConnectUser user = userSession.get(key);
			Session session = user.getSession();
			try {
				if (session.isOpen()) {
					session.getBasicRemote().sendText(message);
				}
			} catch (IOException e) {
			}
		}
	}

	// 접속한 모든 관리자에게 텍스트 전송
	protected void sendMessageToAdminAll(String message, String exclude) {
		Iterator<String> it = adminSession.keySet().iterator();
		while (it.hasNext()) {
			String key = it.next();
			if ( exclude != null && exclude == key )  {
				continue;
			}

			ConnectAdmin admin = adminSession.get(key);
			
			Session session = admin.getSession();

			try {
				if (session.isOpen()) {
					session.getBasicRemote().sendText(message);
				}
			} catch (IOException e) {
			}
		}
	}
	
	// 특정 사용자에게 텍스트 전송
	protected void sendTextMessageToOne(String message, Session session) {
		if (session.isOpen()) {
			try {
				session.getBasicRemote().sendText(message);
			} catch (Exception e) {
				logger.error("fail to send message!", e);
			}
		}
	}
	
	// 유저 - session
	protected ConnectUser getConnectionUser(Session session) {
		Iterator<String> it = userSession.keySet().iterator();

		while (it.hasNext()) {
			String key = it.next();

			ConnectUser dto = userSession.get(key);
			if (dto.getSession() == session) {
				return dto;
			}
		}

		return null;
	}
	
	// 관리자 - session
	protected ConnectAdmin getConnectionAdmin(Session session) {
		Iterator<String> it = adminSession.keySet().iterator();

		while (it.hasNext()) {
			String key = it.next();

			ConnectAdmin dto = adminSession.get(key);
			if (dto.getSession() == session) {
				return dto;
			}
		}

		return null;
	}

	// 관리자 - 파라미터로 전달 받은 유저를 상담중인 관리자 검색
	protected ConnectAdmin getConsultingAdmin(String uidx) {
		Iterator<String> it = adminSession.keySet().iterator();

		while (it.hasNext()) {
			String key = it.next();

			ConnectAdmin dto = adminSession.get(key);
			if (dto.getUidx() != null && dto.getUidx().equals(uidx)) {
				return dto;
			}
		}

		return null;
	}
	
	// 유저, 관리자 - 실시간 채팅방을 나간 경우 접속한 유저 정보 삭제
	protected String removeUser(Session session) {
		try {
			ConnectUser user = getConnectionUser(session);
			if (user != null) {
				// 유저가 접속 해제 한 경우
				user.getSession().close();
				userSession.remove(user.getUidx());
				
				// 관리자에게 접속 해제 사실과 답변 안한 문의가 있으면 전송
				JSONObject jsonSend = new JSONObject();
	    		jsonSend.put("type", "userDisConn");
	    		
	    		UserMessage msg = messageService.lastQuestionUserMessage(user.getUidx());
	    		jsonSend.put("roomIdx", user.getUidx());
	    		if(msg == null) {
	    			jsonSend.put("question", 0);				
	    		} else {
	    			jsonSend.put("question", 1);
	    			
	    			// SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd a h:m");
	    			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	    			String date = sdf.format(msg.getSendDate());
	    			
	    			JSONObject job = new JSONObject();
	    			job.put("roomIdx", user.getUidx());
	   				job.put("userId", user.getUserId());
	   				job.put("userName", user.getUserName());
	   				job.put("content", msg.getContent());
	   				job.put("dateTime", date);

	    			jsonSend.put("userRoom", job);				
	    		}
	    		sendMessageToAdminAll(jsonSend.toString(), null);
				
				return user.getUidx();
			}
		} catch (Exception e) {
		}

		return null;
	}

	protected String removeAdmin(Session session) {
		try {
			ConnectAdmin admin = getConnectionAdmin(session);
			if (admin != null) {
				// 관리자가 접속 해제 한 경우
				admin.getSession().close();
				adminSession.remove(admin.getAidx());
				
				if(adminSession.size() == 0) {
		    		// 온라인 유저에게 실시간 상담이 불가능한 상태임을 알림
		    		JSONObject jsonSend = new JSONObject();
		    		jsonSend.put("type", "consult");
		    		jsonSend.put("state", 0);
		    		sendMessageToUserAll(jsonSend.toString(), null);
				}
				
				return admin.getUidx();
			}			
		} catch (Exception e) {
		}

		return null;
	}
}
