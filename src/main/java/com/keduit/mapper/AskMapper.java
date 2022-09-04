package com.keduit.mapper;

import java.util.List;

import com.keduit.domain.AskVO;
import com.keduit.domain.ReplyVO;

public interface AskMapper {

	public void insertAsk(AskVO vo);
	
	public List<AskVO> getAskList(String userid);
	
	public AskVO selectAsk(Long bno);
	
	public void updateAsk(AskVO vo);
	
	public void deleteAsk(Long bno);
	
	public List<AskVO> getTotalAskList();
	
//================문의게시판 리플CRUD==========================
	
	public int insert(ReplyVO vo);
	
	public List<ReplyVO> getReplyList(Long bno);
	
	public int deleteReply(Long rno);
	
	public ReplyVO readReply(Long rno);
	
	public int updateReply(ReplyVO vo);
	
}
