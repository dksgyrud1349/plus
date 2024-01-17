package com.fa.plus.chatting.mongodb;

import java.util.Date;
import java.util.List;

public interface MessageService {
	public void insertUserRoom(UserRoom dto) throws Exception;
	public void updateUserRoomLastDate(String roomIdx, Date lastDate) throws Exception;
	public void updateUserRoomQuestion(String roomIdx, int question) throws Exception;
	public void updateUserRoom(String roomIdx, int question, Date lastDate) throws Exception;
	public void deleteUserRoom(String roomIdx) throws Exception;
	public UserRoom findByUserRoom(String roomIdx);
	public List<UserRoom> listOnlineUserRoom(String[] roomIdxs);
	public List<UserRoom> listOnlineQuestionUserRoom(String[] roomIdxs);
	public List<UserRoom> listOfflineUserRoom(String[] roomIdxs);
	public List<UserRoom> searchNameUserRoom(String name, String[] exclude);
	public List<UserRoom> searchIdUserRoom(String userId);
	
	public void insertUserMessage(UserMessage dto, String userId) throws Exception;
	public void updateUserMessageRead(String msgId, String readIdx) throws Exception;
	public void updateUserRoomMessageRead(String roomIdx, String readIdx, int classify) throws Exception;
	public void deleteUserMessage(String msgId) throws Exception;
	public void deletePreDateMessage() throws Exception;
	public UserMessage findByUserMessage(String msgId);
	public UserMessage lastQuestionUserMessage(String roomIdx);
	public List<UserMessage> listUserMessage(String roomIdx);
	public List<UserMessage> listUserMessage(String roomIdx, String requestIdx, int classify);
}
