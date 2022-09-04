package com.keduit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keduit.domain.MemberVO;
import com.keduit.domain.MemberVO2;
import com.keduit.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MemberServiceImpl implements MemberService{

	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper member;
	
	@Override
	public void memberRegister(MemberVO2 vo2) {
		member.insertMember(vo2);
	}

	@Override
	public List<MemberVO> readMemberList() {
		return member.getMemberList();
	}

	@Override
	public MemberVO memberRead(String userid) {
		return member.memberRead(userid);
	}

	@Override
	public int memberModify(MemberVO2 vo2) {
		int count=member.memberUpdate(vo2);
		return count;
	}

	@Override
	public int memberRemove(String userid) {
		int count=member.memberDelete(userid);
		return count;
	}

	@Override
	public int overLappingID(String userid) {
		int result = member.overLappingID(userid);
		return result;
	}


	
	

}