package com.fa.plus.chatting.mongodb;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

@Service
public class MessageMongoOperations {
	@Autowired
	private MongoOperations mongo;
	
	// 몽고디비는 로그가 계속 출력 되며, logback.xml에서 제어할 수 있다.
	
	public void insertUserRoom(UserRoom dto) throws Exception {
		try {
			// 채팅룸 저장
			mongo.save(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public void updateUserRoomQuestion(String roomIdx, int question) throws Exception {
		try {
			Query  query = new Query();
			query.addCriteria(Criteria.where("roomIdx").is(roomIdx));
			
			Update update = new Update();
			
			// 질문 존재 여부 변경
			update.set("question", question);
			
			mongo.updateFirst(query, update, UserRoom.class);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public void updateUserRoom(String roomIdx, int question, Date lastDate) throws Exception {
		try {
			Query  query = new Query();
			query.addCriteria(Criteria.where("roomIdx").is(roomIdx));
			
			Update update = new Update();
			
			// 질문 존재 여부 변경
			update.set("question", question);

			// 마지막 메시지 전송일자
			update.set("lastDate", lastDate);
			
			mongo.updateFirst(query, update, UserRoom.class);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	public void updateUserRoomLastDate(String roomIdx, Date lastDate) throws Exception {
		try {
			Query  query = new Query();
			query.addCriteria(Criteria.where("roomIdx").is(roomIdx));
			
			Update update = new Update();
			
			// 마지막 메시지 전송일자
			update.set("lastDate", lastDate);
			
			mongo.updateFirst(query, update, UserRoom.class);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public void deleteUserRoom(String roomIdx) throws Exception {
		try {
			UserRoom dto = findByUserRoom(roomIdx);
			mongo.remove(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public UserRoom findByUserRoom(String roomIdx) {
		UserRoom dto = null;

		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("roomIdx").is(roomIdx));
			dto = mongo.findOne(query, UserRoom.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	// 온라인 유저 룸 리스트
	public List<UserRoom> listOnlineUserRoom(String[] roomIdxs) {
		List<UserRoom> list = null;

		try {
			StringBuilder arr = new StringBuilder("[");
			String ss;
			if(roomIdxs != null) {
				for(int i = 0; i< roomIdxs.length; i++) {
					ss = "'" + roomIdxs[i] +"'";
					if(i != roomIdxs.length) ss += ",";
					arr.append(ss);
				}
			}
			arr.append("]");
			
			// 직접 query를 사용하는 경우 id 컬럼은 _id 로 비교
			BasicQuery query = null;
			String s = "{_id: {$in: " + arr.toString() + "}}";
			query = new BasicQuery(s);
		
			list = mongo.find(query, UserRoom.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 오프라인 유저 룸 리스트
	public List<UserRoom> listOfflineUserRoom(String[] roomIdxs) {
		List<UserRoom> list = null;

		try {
			StringBuilder arr = new StringBuilder("[");
			String ss;
			if(roomIdxs != null) {
				for(int i = 0; i< roomIdxs.length; i++) {
					ss = "'" + roomIdxs[i] +"'";
					if(i != roomIdxs.length) ss += ",";
					arr.append(ss);
				}
			}
			arr.append("]");
			
			BasicQuery query = null;
			String s = "{$and: [{question: 1}, {_id: {$nin: " + arr.toString() + "}}] }";
			query = new BasicQuery(s);
			
			list = mongo.find(query, UserRoom.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	// 관리자 - 모든 룸 리스트
	public List<UserRoom> listUserRoom() {
		List<UserRoom> list = null;

		try {
			Query query = new Query();
			query.with(Sort.by(Sort.Direction.DESC, "lastDate"));
			list = mongo.find(query, UserRoom.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 관리자 - 이름 검색
	public List<UserRoom> searchNameUserRoom(String name, String[] exclude) {
		List<UserRoom> list = null;
		
		try {
			// 채팅 유저에서 이름 검색
			BasicQuery query = null;
			if(exclude == null) {
				query = new BasicQuery("{userName: { $regex: /" + name + "/i }}");
			} else {
				StringBuilder arr = new StringBuilder("[");
				String ss;
				for(int i = 0; i< exclude.length; i++) {
					ss = "'" + exclude[i] +"'";
					if(i != exclude.length) ss += ",";
					arr.append(ss);
				}
				arr.append("]");
				
				String s = "{ $and: [{userName: { $regex: /" + name + "/i }}, {_id: {$nin: " + arr.toString() + "}}] }";
				query = new BasicQuery(s);
			}
			
			list = mongo.find(query, UserRoom.class);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	// 관리자 - 아이디 검색
	public List<UserRoom> searchIdUserRoom(String userId) {
		List<UserRoom> list = null;
		
		try {
			// 채팅 유저에서 이름 검색
			BasicQuery query = null;
			query = new BasicQuery("{userId: '" + userId + "' }");
			
			list = mongo.find(query, UserRoom.class);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	// 채팅 메시지 저장
	public void insertUserMessage(UserMessage dto) throws Exception {
		try {
			mongo.save(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	// 채팅 메시지 수정 - 메시지 읽은 사람 변경
	public void updateUserMessageRead(String msgId, String readIdx) throws Exception {
		try {
			Query  query = new Query();
			query.addCriteria(Criteria.where("msgId").is(msgId));
			
			Update update = new Update();
			
			// 메시지를 읽은 사람 변경
			update.set("readIdx", readIdx);
			
			mongo.updateFirst(query, update, UserMessage.class);			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	// 채팅 메시지 수정 - 메시지 읽은 사람 변경
	public void updateUserRoomMessageRead(String roomIdx, String readIdx, int classify) throws Exception {
		try {
			LocalDate today = LocalDate.now();
			LocalDate preday4 = today.minusDays(4);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String preday = formatter.format(preday4);
			
			String strQuery = "{ $and: [{roomIdx: {$eq: '"+roomIdx+"'}}, {readIdx: null}, {classify: " + classify+"}, {sendDate: {$gte: ISODate('"+preday+"')}}] }";
			BasicQuery query = new BasicQuery(strQuery);
			
			Update update = new Update();
			
			// 메시지를 읽은 사람 변경
			update.set("readIdx", readIdx);
			
			mongo.updateMulti(query, update, UserMessage.class);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	// 채팅 메시지 삭제
	public void deleteUserMessage(String msgId) throws Exception {
		try {
			UserMessage dto = findByUserMessage(msgId);
			mongo.remove(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	// 오늘날짜 기준 5일이 지난 메시지 삭제
	public void deletePreDateMessage() throws Exception {
		try {
			LocalDate today = LocalDate.now();
			LocalDate preday4 = today.minusDays(4);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String preday = formatter.format(preday4);
			
			String strQuery;
			strQuery = "{ $and: [{classify: {$ne:3}}, {sendDate: {$lt: ISODate('"+preday+"')}}] }";
			
			BasicQuery query = new BasicQuery(strQuery);
			
			List<UserMessage> list = mongo.find(query, UserMessage.class);			
			
			mongo.remove(list);
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	// 채팅 메시지
	public UserMessage findByUserMessage(String msgId) {
		UserMessage dto = null;

		try {
			Query query = new Query();
			query.addCriteria(Criteria.where("msgId").is(msgId));
			dto = mongo.findOne(query, UserMessage.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	// 룸의 채팅 메시지 - 오늘날짜부터 5일 전까지의 메시지만 검색
	public List<UserMessage> listUserMessage(String roomIdx) {
		List<UserMessage> list = null;

		try {
			/*
			Query query = new Query();
			query.addCriteria(Criteria.where("roomId").is(roomId));
			query.with(Sort.by(Sort.Direction.DESC, "sendDate"));
			*/
			
			// 오늘날짜부터 5일 전까지의 메시지만 검색
			LocalDate today = LocalDate.now();
			LocalDate preday4 = today.minusDays(4);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String preday = formatter.format(preday4);
			
			String strQuery;
			strQuery = "{ $and: [{roomIdx: {$eq: '"+roomIdx+"'}}, {sendDate: {$gte: ISODate('"+preday+"')}}] }";
			
			BasicQuery query = new BasicQuery(strQuery);
			query.with(Sort.by(Sort.Direction.ASC, "sendDate"));
			
			list = mongo.find(query, UserMessage.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	// 룸에서 5일 이내의 메시지중 가장 최신의 메시지
	public UserMessage lastUserMessage(String roomIdx) {
		UserMessage dto = null;
		
		try {
			// 오늘날짜 기준 5일 이전까지의 메시지만 검색
			LocalDate today = LocalDate.now();
			LocalDate preday4 = today.minusDays(4);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String preday = formatter.format(preday4);
			
			String strQuery;
			strQuery = "{ $and: [{roomIdx: {$eq: '"+roomIdx+"'}}, {sendDate: {$gte: ISODate('"+preday+"')}}] }";
			BasicQuery query = new BasicQuery(strQuery);
			query.with(Sort.by(Sort.Direction.DESC, "sendDate"));
			
			dto = mongo.findOne(query, UserMessage.class);
			
			if(dto != null) {
				// SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd a h:m");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
				dto.setDate(sdf.format(dto.getSendDate()));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	// 룸에서 5일 이내의 메시지중 답변이 안된 최신의 메시지
	public UserMessage lastQuestionUserMessage(String roomIdx) {
		UserMessage dto = null;
		
		try {
			// 오늘날짜 기준 5일 이전까지의 메시지만 검색
			LocalDate today = LocalDate.now();
			LocalDate preday4 = today.minusDays(4);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String preday = formatter.format(preday4);
			
			String strQuery;
			strQuery = "{ $and: [{roomIdx: {$eq: '"+roomIdx+"'}}, {classify: 1}, {readIdx: null},  {sendDate: {$gte: ISODate('"+preday+"')}}] }";
			BasicQuery query = new BasicQuery(strQuery);
			query.with(Sort.by(Sort.Direction.DESC, "sendDate"));
			
			dto = mongo.findOne(query, UserMessage.class);
			
			if(dto != null) {
				// SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd a h:m");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
				dto.setDate(sdf.format(dto.getSendDate()));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}
	
	// 오늘날짜 기준 30일 이내의 공지사항 리스트
	public UserMessage listNoticeMessage() {
		UserMessage dto = null;
		
		try {
			LocalDate today = LocalDate.now();
			LocalDate preday4 = today.minusDays(30);
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			String preday = formatter.format(preday4);
			
			String strQuery;
			strQuery = "{ $and : [{classify : 3}, {sendDate : {$gte : ISODate('"+preday+"')}}] }";
			BasicQuery query = new BasicQuery(strQuery);
			query.with(Sort.by(Sort.Direction.DESC, "sendDate"));
			
			dto = mongo.findOne(query, UserMessage.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}	
}
