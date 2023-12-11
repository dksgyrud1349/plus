package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.Board;
import com.fa.plus.domain.Reply;

public class BoardServiceImpl implements BoardService{

	@Override
	public void insertBoard(Board dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Board> listBoard(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Board findById(long num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateHitCount(long num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Board findByPrev(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Board findByNext(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateBoard(Board dto, String pathname) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoard(long num, String pathname, String userId, int membership) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertBoardLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBoardLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int boardLikeCount(long num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public boolean userBoardLiked(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public void insertReply(Reply dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Reply> listReply(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int replyCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void deleteReply(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertReplyLike(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Map<String, Object> replyLikeCount(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateReplyShowHide(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
