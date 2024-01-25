package com.fa.plus.pluszone.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.pluszone.domain.referManage;
import com.fa.plus.pluszone.mapper.referManageMapper;


@Service
public class referManageServiceImpl implements referManageService {

	@Autowired
	private referManageMapper mapper;

	@Override
	public void insertRefer(referManage dto) throws SQLException {
		try {
			mapper.insertRefer(dto);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateRefer(referManage dto) throws SQLException {
		try {
			mapper.updateRefer(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void deleteRefer(long num) throws SQLException {
		try {
			mapper.deleteRefer(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;

		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<referManage> listRefer(Map<String, Object> map) {
		List<referManage> list = null;

		try {
			list = mapper.listRefer(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}


	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			mapper.updateHitCount(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public referManage findByPrev(Map<String, Object> map) {
		referManage dto = null;

		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public referManage findByNext(Map<String, Object> map) {
		referManage dto = null;

		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public referManage findById(long num) {
		referManage dto = null;

		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public List<referManage> listClass(Long memberIdx) {
		List<referManage> list = null;
		
		try {
			list = mapper.listClass(memberIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public long findByIdx(String userId) {
		long memberIdx = 0;
		try {
			memberIdx = mapper.findByIdx(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return memberIdx;
	
	}

}
