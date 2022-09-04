package com.keduit.service;

import java.util.List;

import com.keduit.domain.MemberVO;
import com.keduit.domain.MemberVO2;

public interface MemberService {
	
	public void memberRegister(MemberVO2 vo2);
	
	public List<MemberVO> readMemberList();
	
	public MemberVO memberRead(String userid);
	
	public int memberModify(MemberVO2 vo2);
	
	public int memberRemove(String userid);
	
	public int overLappingID(String userid);

}
