package com.fa.plus.chatting.mongodb;

import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MessageServiceImpl implements MessageService {
	@Autowired
	private MessageMongoOperations operations;

	@Override
	public void insertUserRoom(UserRoom dto) throws Exception {
		try {
			// 룸 저장
			operations.insertUserRoom(dto);
		} catch (Exception e) {
		}
	}

	@Override
	public void updateUserRoomLastDate(String roomIdx, Date lastDate) throws Exception {
		try {
			operations.updateUserRoomLastDate(roomIdx, lastDate);
		} catch (Exception e) {
		}
	}

	@Override
	public void updateUserRoomQuestion(String roomIdx, int question) throws Exception {
		try {
			operations.updateUserRoomQuestion(roomIdx, question);
		} catch (Exception e) {
		}
	}
	
	@Override
	public void updateUserRoom(String roomIdx, int question, Date lastDate) throws Exception {
		try {
			operations.updateUserRoom(roomIdx, question, lastDate);
		} catch (Exception e) {
		}
	}
	
	@Override
	public void deleteUserRoom(String roomIdx) throws Exception {
		try {
			operations.deleteUserRoom(roomIdx);
		} catch (Exception e) {
		}
	}

	@Override
	public UserRoom findByUserRoom(String roomIdx) {
		UserRoom dto = null;
		
		try {
			dto = operations.findByUserRoom(roomIdx);
		} catch (Exception e) {
		}
		
		return dto;
	}

	@Override
	public List<UserRoom> listOnlineUserRoom(String[] roomIdxs) {
		// 모든 온라인 유저의 마지막 메시지
		List<UserRoom> list = null;
		
		try {
			list = operations.listOnlineUserRoom(roomIdxs);
			
			for(UserRoom room : list) {
				UserMessage msg = operations.lastUserMessage(room.getRoomIdx());
				if(msg != null) {
					room.setContent(msg.getContent());
					room.setDate(msg.getDate());
				}
			}
		} catch (Exception e) {
		}
		
		return list;
	}
	
	@Override
	public List<UserRoom> listOnlineQuestionUserRoom(String[] roomIdxs) {
		// 온라인 유저중 문의에 대한 답변이 없는 유저 및 마지막 메시지
		List<UserRoom> list = null;
		
		try {
			/*
			list = new Vector<UserRoom>();
			List<Summary> countList = operations.countOnlineUserMessage(roomIdxs);
			for(Summary s : countList) {
				if(s.getResult() > 0) {
					UserRoom room = operations.findByUserRoom(s.get_id());
					if(room == null) continue;
					
					UserMessage msg = operations.lastQuestionUserMessage(s.get_id());
					if(msg == null) continue;
					
					room.setContent(msg.getContent());
					room.setDate(msg.getDate());
					
					list.add(room);
				}
			}
			*/
			
			list = operations.listOnlineUserRoom(roomIdxs);
			int size = list.size();
			
			for(int i = 0; i < size; i++) {
				UserRoom room = list.get(i);
				UserMessage msg = operations.lastQuestionUserMessage(room.getRoomIdx());
				if(msg == null) {
					list.remove(i);
					i--;
					size--;
				} else {
					room.setContent(msg.getContent());
					room.setDate(msg.getDate());
				}
			}
			
			Comparator<UserRoom> comp = new Comparator<UserRoom>() {
				@Override
				public int compare(UserRoom o1, UserRoom o2) {
					if (o1.getLastDate().getTime() > o2.getLastDate().getTime()) {
						return 1;
					} else if(o1.getLastDate().getTime() < o2.getLastDate().getTime()) {
						return -1;
					} else {
						return 0;
					}
				}
			};
			list.sort(comp);
			
		} catch (Exception e) {
		}
		
		return list;
	}

	@Override
	public List<UserRoom> listOfflineUserRoom(String[] roomIdxs) {
		// 오프라인 유저중 질문에 대한 답변이 없는 유저 및 마지막 메시지
		List<UserRoom> list = null;
		
		try {
			/*
			list = new Vector<UserRoom>();
			List<Summary> countList = operations.countOfflineUserMessage(roomIdxs);
			for(Summary s : countList) {
				if(s.getResult() > 0) {
					UserRoom room = operations.findByUserRoom(s.get_id());
					if(room == null) continue;
					
					UserMessage msg = operations.lastQuestionUserMessage(s.get_id());
					if(msg == null) continue;
					
					room.setContent(msg.getContent());
					room.setDate(msg.getDate());
					
					list.add(room);
				}
			}
			*/
			
			list = operations.listOfflineUserRoom(roomIdxs);
			int size = list.size();
			
			for(int i = 0; i < size; i++) {
				UserRoom room = list.get(i);
				UserMessage msg = operations.lastQuestionUserMessage(room.getRoomIdx());
				if(msg == null) {
					list.remove(i);
					i--;
					size--;
				} else {
					room.setContent(msg.getContent());
					room.setDate(msg.getDate());
				}
			}
			
			Comparator<UserRoom> comp = new Comparator<UserRoom>() {
				@Override
				public int compare(UserRoom o1, UserRoom o2) {
					if (o1.getLastDate().getTime() > o2.getLastDate().getTime()) {
						return 1;
					} else if(o1.getLastDate().getTime() < o2.getLastDate().getTime()) {
						return -1;
					} else {
						return 0;
					}
				}
			};
			list.sort(comp);
		} catch (Exception e) {
		}
		
		return list;
	}

	@Override
	public List<UserRoom> searchNameUserRoom(String name, String[] exclude) {
		List<UserRoom> list = null;
		
		try {
			list = operations.searchNameUserRoom(name, exclude);
		} catch (Exception e) {
		}
		
		return list;
	}

	@Override
	public List<UserRoom> searchIdUserRoom(String userId) {
		List<UserRoom> list = null;
		
		try {
			list = operations.searchIdUserRoom(userId);
		} catch (Exception e) {
		}
		
		return list;
	}

	@Override
	public void insertUserMessage(UserMessage dto, String userId) throws Exception {
		try {
			// 메시지 등록
			Date registerDate = new Date();
			dto.setMsgId(ObjectId.get());
			dto.setSendDate(registerDate);
			
			if(dto.getClassify() == 3) { // 공지 사항
				operations.insertUserMessage(dto);
				return;
			}
			
			UserRoom room = operations.findByUserRoom(dto.getRoomIdx());
			if(dto.getClassify() == 2) { // 답변
				if(room == null && userId == null) {
					return;
				}
				
				if(room == null) {
					room = new UserRoom();
					room.setRoomIdx(dto.getRoomIdx());
					room.setUserId(userId);
					room.setUserName(dto.getToName());
					operations.insertUserRoom(room);
				}
				room.setQuestion(0);
					
				// 유저의 모든 질문을 읽음으로 변경
				operations.updateUserRoomMessageRead(room.getRoomIdx(), dto.getFromIdx(), 1);
			} else if(dto.getClassify() == 1) { // 질문
				if(room == null) {
					room = new UserRoom();
					room.setRoomIdx(dto.getFromIdx());
					room.setUserId(userId);
					room.setUserName(dto.getFromName());
					
					operations.insertUserRoom(room);
				}
				
				room.setQuestion(1);
			}
			operations.insertUserMessage(dto);
			operations.updateUserRoom(room.getRoomIdx(), room.getQuestion(), registerDate);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 M월 d일 E요일");
			SimpleDateFormat sdf3 = new SimpleDateFormat("a h:m");
			dto.setDate(sdf.format(dto.getSendDate()));
			dto.setDateWeek(sdf2.format(dto.getSendDate()));
			dto.setTime(sdf3.format(dto.getSendDate()));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void updateUserMessageRead(String msgId, String readIdx) throws Exception {
		try {
			operations.updateUserMessageRead(msgId, readIdx);
		} catch (Exception e) {
		}
	}
	
	@Override
	public void updateUserRoomMessageRead(String roomIdx, String readIdx, int classify) throws Exception {
		try {
			operations.updateUserRoomMessageRead(roomIdx, readIdx, classify);
		} catch (Exception e) {
		}
	}

	@Override
	public void deleteUserMessage(String msgId) throws Exception {
		try {
			operations.deleteUserMessage(msgId);
		} catch (Exception e) {
		}
	}

	@Override
	public void deletePreDateMessage() throws Exception {
		try {
			// 오늘날짜 기준 5일이 지난 메시지 삭제
			operations.deletePreDateMessage();
		} catch (Exception e) {
		}
	}

	@Override
	public UserMessage findByUserMessage(String msgId) {
		UserMessage dto = null;
		
		try {
			dto = operations.findByUserMessage(msgId);
		} catch (Exception e) {
		}
		
		return dto;
	}

	@Override
	public UserMessage lastQuestionUserMessage(String roomIdx) {
		UserMessage dto = null;
		
		try {
			dto = operations.lastQuestionUserMessage(roomIdx);
		} catch (Exception e) {
		}
		
		return dto;
	}
	
	@Override
	public List<UserMessage> listUserMessage(String roomIdx) {
		List<UserMessage> list = null;
		// 관리자가 룸의 메시지를 요청한 경우
		try {
			list = operations.listUserMessage(roomIdx);
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 M월 d일 E요일");
			SimpleDateFormat sdf3 = new SimpleDateFormat("a h:m");
			for(UserMessage msg : list) {
				msg.setDate(sdf.format(msg.getSendDate()));
				msg.setDateWeek(sdf2.format(msg.getSendDate()));
				msg.setTime(sdf3.format(msg.getSendDate()));
			}	
		} catch (Exception e) {
		}
		
		return list;
	}

	@Override
	public List<UserMessage> listUserMessage(String roomIdx, String requestIdx, int classify) {
		List<UserMessage> list = null;
		
		// 유저가 룸의 메시지를 요청한 경우
		try {
			list = operations.listUserMessage(roomIdx);
			
			if(classify == 1) {
				// 유저가 메시지를 요청한 경우 답변을 읽음으로 변경
				operations.updateUserRoomMessageRead(roomIdx, requestIdx, 2);
			}
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
			SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy년 M월 d일 E요일");
			SimpleDateFormat sdf3 = new SimpleDateFormat("a h:m");
			for(UserMessage msg : list) {
				msg.setDate(sdf.format(msg.getSendDate()));
				msg.setDateWeek(sdf2.format(msg.getSendDate()));
				msg.setTime(sdf3.format(msg.getSendDate()));
			}	
		} catch (Exception e) {
		}
		
		return list;
	}
}
