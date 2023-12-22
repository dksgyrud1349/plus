package com.fa.plus.pluszone.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.fa.plus.pluszone.domain.NoticePlus;
import com.fa.plus.pluszone.mapper.NoticePlusMapper;

@Service
public class NoticePlusServiceImpl implements NoticePlusService{
	
	@Autowired
	private NoticePlusMapper mapper;
	
	@Override
	public void insertNotice(NoticePlus dto) throws Exception {
		try {
			long seq = mapper.noticePlusSeq();
			dto.setNum(seq);

			mapper.insertNotice(dto);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public int dataCount(Map<String, Object> map) {
		int result = 0;
		
		try {
			result = mapper.dataCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<NoticePlus> listNoticeTop(Map<String, Object> map) {
		List<NoticePlus> list = null;
		
		try {
			list = mapper.listNoticeTop(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<NoticePlus> listNotice(Map<String, Object> map) {
		List<NoticePlus> list = null;
		
		try {
			list = mapper.listNotice(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<NoticePlus> listTitle(long memberIdx) {
		List<NoticePlus> list = null;
		
		try {
			list = mapper.listTitle(memberIdx);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	
	@Override
	public void updateHitCount(long num) throws Exception {
		try {
			mapper.updateHitCount(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public NoticePlus findById(long num) {
		NoticePlus dto = null;
		
		try {
			dto = mapper.findById(num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public NoticePlus findByPrev(Map<String, Object> map) {
		NoticePlus dto = null;
		
		try {
			dto = mapper.findByPrev(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public NoticePlus findByNext(Map<String, Object> map) {
		NoticePlus dto = null;
				
		try {
			dto = mapper.findByNext(map);
		} catch (Exception e) {
			e.printStackTrace();
		}		
				
		return dto;
	}

	@Override
	public void updateNotice(NoticePlus dto) throws Exception {
		try {
			mapper.updateNotice(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public void deleteNotice(long num) throws Exception {
		try {
			mapper.deleteNotice(num);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

}
