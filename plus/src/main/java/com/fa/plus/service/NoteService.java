package com.fa.plus.service;

import java.util.List;

import java.util.Map;

import com.fa.plus.domain.Note;

public interface NoteService {
	public List<Note> listMember(Map<String, Object> map);
	
	public void insertNote(Note dto) throws Exception;

	public int dataCountReceive(Map<String, Object> map);
	public List<Note> listReceive(Map<String, Object> map);
	
	public int dataCountSend(Map<String, Object> map);
	public List<Note> listSend(Map<String, Object> map);
	
	public Note findByReceiveId(long noteNum);
	public Note findByReceivePrev(Map<String, Object> map);
	public Note findByReceiveNext(Map<String, Object> map);
	
	public Note findBySendId(long noteNum);
	public Note findBySendPrev(Map<String, Object> map);
	public Note findBySendNext(Map<String, Object> map);
	
	public void updateIdentifyDate(long noteNum) throws Exception;
	
	public void deleteNote(Map<String, Object> map) throws Exception;
	
	public int newNoteCount(long memberIdx);
}
