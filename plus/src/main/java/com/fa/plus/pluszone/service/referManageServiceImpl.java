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
			mapper.insertrefer(dto);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateRefer(referManage dto) throws SQLException {
		try {
			mapper.updaterefer(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

	}

	@Override
	public void deleteRefer(long num) throws SQLException {
		try {
			mapper.deleterefer(num);
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
	public List<referManage> listReferTitle(long memberIdx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<referManage> listRefer(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<referManage> listReferTop(Map<String, Object> map) {
		List<referManage> list = null;

		try {
			list = mapper.listrReferTop(map);
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

}
