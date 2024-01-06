package com.fa.plus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.PlusAns;
import com.fa.plus.domain.PlusQ;
import com.fa.plus.mapper.OnedayplusMapper;

@Service
public class OnedayplusServiceImpl implements OnedayplusService {
	
	@Autowired
	private OnedayplusMapper mapper;
	
	@Override
	public void insertAnswer(PlusAns dto) throws Exception {
		try {
			
			mapper.deleteAnswer(dto.getUserId());
			
			for(Long plusNum : dto.getPlusNums()) {
				dto.setPlusNum(plusNum);
				
				mapper.insertAnswer(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<PlusQ> QSubject() {
		List<PlusQ> list = null;
		try {
			list = mapper.QSubject();
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public List<PlusQ> listQuestion() {
		List<PlusQ> list = null;
		try {
			list = mapper.listQuestion();
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

	@Override
	public List<PlusAns> listAnswer(String userId) {
		List<PlusAns> list = null;
		try {
			list = mapper.listAnswer(userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		return list;
	}

}
