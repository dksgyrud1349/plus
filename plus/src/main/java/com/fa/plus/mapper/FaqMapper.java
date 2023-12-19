package com.fa.plus.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.domain.Faq;

@Mapper
public interface FaqMapper {
	public int dataCount(Map<String, Object>map);
	public List<Faq> listFaq(Map<String, Object> map);
	public List<Faq> listCateNum(Map<String, Object> map);
	
}
