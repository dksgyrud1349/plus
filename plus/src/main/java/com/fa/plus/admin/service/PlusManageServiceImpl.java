package com.fa.plus.admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fa.plus.admin.domain.Answer;
import com.fa.plus.admin.domain.MemberManage;
import com.fa.plus.admin.domain.Qna;
import com.fa.plus.admin.mapper.PlusManageMapper;

@Service
public class PlusManageServiceImpl implements PlusManageService{

	@Autowired
	private PlusManageMapper mapper;
	
	@Override
	public List<MemberManage> plusList(Map<String, Object> map) {
		List<MemberManage> list = null;
		try {
			list = mapper.plusList(map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
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
	public List<Qna> findByQna(String userId) {
		List<Qna> list = null;
		try {
			list = mapper.findByQna(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Answer> answerChart() {
		List<Answer> list = null;
		try {
			list = mapper.answerChart();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Answer> answerChart1() {
		List<Answer> list = null;
		try {
			list = mapper.answerChart1();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Answer> answerChart2() {
		List<Answer> list = null;
		try {
			list = mapper.answerChart2();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Answer> answerChart3() {
		List<Answer> list = null;
		try {
			list = mapper.answerChart3();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public List<Answer> answerChart4() {
		List<Answer> list = null;
		try {
			list = mapper.answerChart4();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void updateMembership(Map<String, Object> map) throws Exception {
		try {
			mapper.updateMembership(map);
		} catch (Exception e) {
		
		}
	}

	@Override
	public MemberManage findById(String userId) {
		MemberManage dto = null;

		try {
			dto = mapper.findById(userId);

			if (dto != null) {
				if (dto.getEmail() != null) {
					String[] s = dto.getEmail().split("@");
					dto.setEmail1(s[0]);
					dto.setEmail2(s[1]);
				}

				if (dto.getTel() != null) {
					String[] s = dto.getTel().split("-");
					dto.setTel1(s[0]);
					dto.setTel2(s[1]);
					dto.setTel3(s[2]);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public void updateFailureCountReset(String userId) throws Exception {
		try {
			mapper.updateFailureCountReset(userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateMemberEnabled(Map<String, Object> map) throws Exception {
		try {
			mapper.updateMemberEnabled(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void insertMemberState(MemberManage dto) throws Exception {
		try {
			mapper.insertMemberState(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public List<MemberManage> listMemberState(String userId) {
		List<MemberManage> list = null;
		
		try {
			list = mapper.listMemberState(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public MemberManage findByState(String userId) {
		MemberManage dto = null;

		try {
			dto = mapper.findByState(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}

	@Override
	public MemberManage findIdx(String userId) {
		MemberManage dto = null;
		try {
			dto = mapper.findIdx(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}