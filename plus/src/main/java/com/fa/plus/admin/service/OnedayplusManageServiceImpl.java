package com.fa.plus.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.OnedayplusManage;
import com.fa.plus.admin.mapper.OnedayplusManageMapper;

@Service
public class OnedayplusManageServiceImpl implements OnedayplusManageService {

	@Autowired
	OnedayplusManageMapper mapper;
	
	@Override
	public void insertOnedayplusQuestion(OnedayplusManage dto) throws Exception {
		try {
			long plusSeq = mapper.plusSeq();
			dto.setNum(plusSeq);
			mapper.insertOnedayplusQSubject(dto);
			if(dto.getContents() != null ) {
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateOnedayplusQuestion(OnedayplusManage dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteOnedayplusQuestion(long num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insertOnedayplusContent(OnedayplusManage dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateOnedayplusContent(OnedayplusManage dto) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteOnedayplusContent(long plusNum) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int dataCount() {
		int result = 0;
		try {
			result = mapper.dataCount();
		} catch (Exception e) {
		}
		return result;
	}

	@Override
	public List<OnedayplusManage> QSubject() {
		List<OnedayplusManage> list = null;
		try {
			list = mapper.QSubject();
		} catch (Exception e) {
		}
		return list;
	}

	@Override
	public List<OnedayplusManage> listQuestion() {
		List<OnedayplusManage> list = null;
		try {
			list = mapper.listQuestion();
		} catch (Exception e) {
		}
		return list;
	}

}
