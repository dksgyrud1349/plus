package com.fa.plus.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.Refund;
import com.fa.plus.mapper.RefundMapper;

@Service
public class RefundServiceImpl implements RefundService{

	@Autowired
	private RefundMapper mapper;
	
	@Override
	public void insertRefund(Refund dto) throws Exception {
		try {
			mapper.insertRefund(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Refund findByMileage(Map<String, Object> map) {
		Refund dto = null;
		try {
			dto = mapper.findByMileage(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updateMinusMileage(Map<String, Object> map) throws Exception {
		try {
			mapper.updateMinusMileage(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updatePlusMileage(Map<String, Object> map) throws Exception {
		try {
			mapper.updatePlusMileage(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public Refund findByCount(long orderNum) {
		Refund dto = null;
		try {
			dto = mapper.findByCount(orderNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public void updatePlusCount(Map<String, Object> map) throws Exception {
		try {
			mapper.updatePlusCount(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateMState(long orderNum) throws Exception {
		try {
			mapper.updateMState(orderNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateState(long orderNum) throws Exception {
		try {
			mapper.updateState(orderNum);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

}
