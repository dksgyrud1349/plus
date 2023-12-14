package com.fa.plus.service;

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

			// mapper.insertMember1(dto);
			// mapper.insertMember2(dto);
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
	
	
	
}
