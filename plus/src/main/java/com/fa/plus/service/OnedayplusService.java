package com.fa.plus.service;

import java.util.List;
import java.util.Map;

import com.fa.plus.domain.Lesson;
import com.fa.plus.domain.PlusAns;
import com.fa.plus.domain.PlusQ;

public interface OnedayplusService {
	public void insertAnswer(PlusAns dto) throws Exception;

	public List<PlusQ> QSubject();
	public List<PlusQ> listQuestion();
	public List<PlusAns> listAnswer(String userId);

	public List<Lesson> resultClass(Map<String,Object> map);
	public String resultPurpose(String userId); 
	public String resultCategory(String userId);
	public String resultLocation(String userId);
	public long resultPrice(String userId);
}
