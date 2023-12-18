package com.fa.plus.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.fa.plus.domain.Member;
import com.fa.plus.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private BCryptPasswordEncoder bcryptEncoder;

	@Override
	public void insertMember(Member dto) throws Exception {
		try {
			if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			}

			if (dto.getTel1().length() != 0 && dto.getTel2().length() != 0 && dto.getTel3().length() != 0) {
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			}

			// 패스워드 암호화
			String encPwd = bcryptEncoder.encode(dto.getUserPwd());
			dto.setUserPwd(encPwd);
			
			long memberSeq = mapper.memberSeq();
			dto.setMemberIdx(memberSeq);

			// 회원정보 저장
			mapper.insertMember(memberSeq);

			mapper.insertMember12(dto); // member1, member2 테이블 동시에
			
			// 권한 저장
			dto.setAuthority("USER");
			mapper.insertAuthority(dto);
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}

	@Override
	public Member findById(String userId) {
		Member dto = null;

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
	public Member findByMemberIdx(long memberIdx) {
		Member dto = null;

		try {
			dto = mapper.findByMemberIdx(memberIdx);

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
	public void updateMembership(Map<String, Object> map) throws Exception {
		try {
			mapper.updateMembership(map);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateLastLogin(String userId) throws Exception {
		try {
			mapper.updateLastLogin(userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public void updateMember(Member dto) throws Exception {
		try {
			if (dto.getEmail1().length() != 0 && dto.getEmail2().length() != 0) {
				dto.setEmail(dto.getEmail1() + "@" + dto.getEmail2());
			}

			if (dto.getTel1().length() != 0 && dto.getTel2().length() != 0 && dto.getTel3().length() != 0) {
				dto.setTel(dto.getTel1() + "-" + dto.getTel2() + "-" + dto.getTel3());
			}

			// 패스워드가 변경된 경우만 member1 테이블의 패스워드를 변경하도록 변경해야함
			boolean bPwdUpdate = ! isPasswordCheck(dto.getUserId(), dto.getUserPwd());
			if(bPwdUpdate) {
				// 패스워드가 변경된 경우
				String encPwd = bcryptEncoder.encode(dto.getUserPwd());
				
				dto.setUserPwd(encPwd);
				
				mapper.updateMember1(dto);
			}
					
			mapper.updateMember2(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}		
	}
	
	/*
	@Override
	public void generatePwd(Member dto) throws Exception {
		// TODO Auto-generated method stub
		
	}
	*/
	
	@Override
	public boolean isPasswordCheck(String userId, String userPwd) {
		// 패스워드 비교
		Member dto = findById(userId);
		if (dto == null) {
			return false;
		}
		// 암호화 되지 않은 패스워드, 암호화된 패스워드
		return bcryptEncoder.matches(userPwd, dto.getUserPwd());
	}

	@Override
	public void updatePwd(Member dto) throws Exception {
		try {
			if(isPasswordCheck(dto.getUserId(), dto.getUserPwd())) {
				throw new RuntimeException("패스워드가 기존 패스워드와 일치합니다.");
			}
			
			String encPwd = bcryptEncoder.encode(dto.getUserPwd());
			dto.setUserPwd(encPwd);
			
			mapper.updateMember1(dto);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}

	@Override
	public int checkFailureCount(String userId) {
		int result = 0;
		try {
			result = mapper.checkFailureCount(userId);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public void updateFailureCount(String userId) throws Exception {
		try {
			mapper.updateFailureCount(userId);
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
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
	public void insertMemberState(Member dto) throws Exception {
		try {
			mapper.insertMemberState(dto);
		
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		
	}
	
	
	
}
