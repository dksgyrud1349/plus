package com.fa.plus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Terms;

@Mapper
public interface TermsMapper {
	public List<Terms> listTerms();
}
