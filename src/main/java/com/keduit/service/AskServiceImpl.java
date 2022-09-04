package com.keduit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keduit.domain.AskVO;
import com.keduit.domain.ReplyVO;
import com.keduit.mapper.AskMapper;
import com.keduit.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Service
@Log4j
public class AskServiceImpl implements AskService{

	@Setter(onMethod_ = @Autowired)
	private AskMapper mapper;
	
	@Setter(onMethod_ = @Autowired)	
	private AskMapper mapper2;
	
	@Override
	public void askRegister(AskVO vo) {
		mapper.insertAsk(vo);
	}

	@Override
	public List<AskVO> askList(String userid) {
		return mapper.getAskList(userid);
	}

	@Override
	public AskVO askRead(Long bno) {
		return mapper.selectAsk(bno);
	}

	@Override
	public void askModify(AskVO vo) {
		mapper.updateAsk(vo);
	}

	@Override
	public void askRemove(Long bno) {
		mapper.deleteAsk(bno);
	}
	
	@Override
	public List<AskVO> totalAskList() {
		return mapper.getTotalAskList();
	}
	
//================문의게시판 리플CRUD==========================		
	
	@Override
	public int register(ReplyVO vo) {
		return mapper2.insert(vo);
	}
	
	@Override
	public List<ReplyVO> readReplyList(Long bno) {		
		return mapper2.getReplyList(bno);
	}
	
	
	@Override
	public int removeReply(Long rno) {
		return mapper2.deleteReply(rno);
	}
	
	@Override
	public ReplyVO readReply(Long rno) {
		return mapper2.readReply(rno);
	}

	@Override
	public int modifyReply(ReplyVO vo) {
		return mapper2.updateReply(vo);
	}
	
}
