package com.fa.plus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.Declaration;
import com.fa.plus.mapper.DeclarationMapper;

@Service
public class DeclarationServiceImpl implements DeclarationService{

	@Autowired
	private DeclarationMapper declarationMapper;
	
	@Override
	public Declaration findById(String userId) {
		Declaration dto =  null;
		try {
			dto = declarationMapper.findById(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public List<Declaration> findByAllClass(){
		List<Declaration> list = null;
		try {
			list = declarationMapper.findByAllClass();
		} catch (Exception e) {

		}
		return list;
	}

	@Override
	public long findByNum(String className) {
		long classNum = 0;
		try {
			classNum = declarationMapper.findByNum(className);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return classNum;
	}
	
	@Override
	public void insertDeclaration(Declaration dto) throws Exception {
		try {
			declarationMapper.insertDeclaration(dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
