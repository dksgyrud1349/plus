package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.Faq;


public interface FaqService {

	public int dataCount(Map<String, Object> map);
	public List<Faq> listFaq(Map<String, Object>map);
	public Faq findByPrev(Map<String, Object>map);
	public Faq findByNext(Map<String, Object>map);
	public Faq findByFaqNum(long num);
	
	public List<Faq> listFaqTop();
}
