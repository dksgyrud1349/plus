package com.fa.plus.pluszone.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.pluszone.domain.FaqPlus;

public interface FaqPlusService {
	public int dataCount(Map<String, Object> map);
	public List<FaqPlus> listFaq(Map<String, Object> map);
	public List<FaqPlus> listCategory(Map<String, Object> map);
}
