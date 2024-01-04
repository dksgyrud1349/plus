package com.fa.plus.mapper;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Note;

@Mapper
public interface NoteMapper {
	public List<Note> listMember(Map<String, Object> map);
	
	public void insertNote(Note dto) throws SQLException;
	
	public int dataCountReceive(Map<String, Object> map);
	public List<Note> listReceive(Map<String, Object> map);
	public Note findByReceiveId(long noteNum);
	public Note findByReceivePrev(Map<String, Object> map);
	public Note findByReceiveNext(Map<String, Object> map);

	public int dataCountSend(Map<String, Object> map);
	public List<Note> listSend(Map<String, Object> map);
	public Note findBySendId(long noteNum);
	public Note findBySendPrev(Map<String, Object> map);
	public Note findBySendNext(Map<String, Object> map);
	
	public Note findByReplyReceiveId(long noteNum);

	public void updateIdentifyDay(long noteNum) throws SQLException;
	public void updateDeleteState(Map<String, Object> map) throws SQLException;
	public void deleteNote(Map<String, Object> map) throws SQLException;
	
	public int newNoteCount(long memberIdx);
}
