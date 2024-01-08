package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.Lesson;
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

	@Override
	public List<Lesson> resultClass(Map<String, Object> map) {
		List<Lesson> list = null;
		try {
			list = mapper.resultClass(map);
			
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public String resultPurpose(String userId) {
		String purpose = "";
		try {
			purpose = mapper.resultPurpose(userId);
		} catch (Exception e) {
		}
		return purpose;
	}

	@Override
	public String resultCategory(String userId) {
		String category = "";
		try {
			category = mapper.resultCategory(userId);
		} catch (Exception e) {
		}
		return category;
	}

	@Override
	public String resultLocation(String userId) {
		String location = "";
		try {
			location = mapper.resultLocation(userId);
		} catch (Exception e) {
		}
		return location;
	}

	@Override
	public long resultPrice(String userId) {
		long classprice = 0;
		try {
			classprice = mapper.resultPrice(userId);
		} catch (Exception e) {
		}
		return classprice;
	}


}
