package com.fa.plus.service;

import java.util.List;

import com.fa.plus.domain.PlusAns;
import com.fa.plus.domain.PlusQ;

public interface OnedayplusService {
	public void insertAnswer(PlusAns dto) throws Exception;

	public List<PlusQ> QSubject();
	public List<PlusQ> listQuestion();
	public PlusAns listAnswer(String userId);
}
