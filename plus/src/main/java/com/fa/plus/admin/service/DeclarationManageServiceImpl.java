package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.mapper.DeclarationManageMapper;
import com.fa.plus.domain.Declaration;

@Service
public class DeclarationManageServiceImpl implements DeclarationManageService{

	@Autowired
	private DeclarationManageMapper mapper;
	
	@Override
	public List<Declaration> listDeclarations(Map<String, Object> map) {
		List<Declaration> list =  null;
		try {
			list = mapper.listDeclarations(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int dataCount = 0;
		try {
			dataCount = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dataCount;
	}

	@Override
	public void updateResult(Declaration dto) {
		try {
			mapper.updateResult(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	@Override
	public void updateShowClass(Long classNum) {
		try {
			mapper.updateShowClass(classNum);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
