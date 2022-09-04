package com.keduit.mapper;

import java.util.List;

import com.keduit.domain.MemberVO;
import com.keduit.domain.MemberVO2;

public interface MemberMapper {

	public MemberVO read(String userid);
	
	public void insertMember(MemberVO2 vo2);
	
	public List<MemberVO> getMemberList();
	
	public MemberVO memberRead(String userid);
	
	public int memberUpdate (MemberVO2 vo2);
	
	public int memberDelete(String userid);
	
	public int overLappingID(String userid);
}
