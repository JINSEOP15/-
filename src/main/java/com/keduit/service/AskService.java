package com.keduit.service;

import java.util.List;

import com.keduit.domain.AskVO;
import com.keduit.domain.ReplyVO;

public interface AskService {
	
	public void askRegister(AskVO vo);
	
	public List<AskVO> askList(String userid);

	public AskVO askRead(Long bno);
	
	public void askModify(AskVO vo);
	
	public void askRemove(Long bno);
	
	public List<AskVO> totalAskList();
	
//================문의게시판 리플CRUD==========================	
	
	public int register(ReplyVO vo);
	
	public List<ReplyVO> readReplyList(Long bno);
	
	public int removeReply(Long rno);
	
	public ReplyVO readReply(Long rno);
	
	public int modifyReply(ReplyVO vo);
}
