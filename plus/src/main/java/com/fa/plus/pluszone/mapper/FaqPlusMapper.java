package com.fa.plus.pluszone.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fa.plus.pluszone.domain.FaqPlus;

@Mapper
public interface FaqPlusMapper {
	public int dataCount(Map<String, Object> map);
	public List<FaqPlus> listFaq(Map<String, Object> map);
	public List<FaqPlus> listCategory(Map<String, Object> map);
}
