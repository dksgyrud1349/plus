package com.fa.plus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.Terms;
import com.fa.plus.mapper.TermsMapper;
@Service
public class TermsServiceImpl implements TermsService{
	@Autowired
	private TermsMapper mapper;
	
	@Override
	public List<Terms> listTerms() {
		List<Terms> list = null;
		
		try {
			list = mapper.listTerms();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
