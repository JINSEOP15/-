package com.keduit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.keduit.domain.Criteria;
import com.keduit.domain.ReplyPageDTO;
import com.keduit.domain.ReplyVO;
import com.keduit.mapper.BoardMapper;
import com.keduit.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	
	@Setter(onMethod_=@Autowired)
	private BoardMapper boardMapper;
	
	@Setter(onMethod_=@Autowired)
	private ReplyMapper mapper;
	
	
	//==========댓글 새 글 작성==========	
	@Transactional
	@Override
	public int companyVal_Reply_TB_Reg(ReplyVO vo) {
		log.info("댓글 등록! ---------");
		
		boardMapper.companyVal_TB_ReplyCnt(vo.getBno(), 1);
		
		return mapper.companyVal_Insert(vo);
	}
	
	@Transactional
	@Override
	public int interviewAns_Reply_TB_Reg(ReplyVO vo) {
		log.info("댓글 등록! ---------");
		
		boardMapper.interviewAns_TB_ReplyCnt(vo.getBno(), 1);
		
		return mapper.interviewAns_Insert(vo);
	}
	
	@Transactional
	@Override
	public int passLatter_Reply_TB_Reg(ReplyVO vo) {
		log.info("댓글 등록! ---------");
		
		boardMapper.passLatter_TB_ReplyCnt(vo.getBno(), 1);
		
		return mapper.passLatter_Insert(vo);
	}
	
	@Transactional
	@Override
	public int worryQnA_Reply_TB_Reg(ReplyVO vo) {
		log.info("댓글 등록! ---------");
		
		boardMapper.worryQnA_TB_ReplyCnt(vo.getBno(), 1);
		
		return mapper.worryQnA_Insert(vo);
	}
	
	@Transactional
	@Override
	public int passSelfIntroduct_Reply_TB_Reg(ReplyVO vo) {
		log.info("댓글 등록! ---------");
		
		boardMapper.passSelfIntroduct_TB_ReplyCnt(vo.getBno(), 1);
		
		return mapper.passSelfIntroduct_Insert(vo);
	}
	
	
	//==========댓글 1건 조회==========	
	@Override
	public ReplyVO companyVal_Reply_Get(Long rno) {
		log.info("댓글 상세 조회! -------");
		return mapper.companyVal_Read(rno);
	}
	
	public ReplyVO interviewAns_Reply_Get(Long rno) {
		log.info("댓글 상세 조회! -------");
		return mapper.interviewAns_Read(rno);
	}
	
	public ReplyVO passLatter_Reply_Get(Long rno) {
		log.info("댓글 상세 조회! -------");
		return mapper.passLatter_Read(rno);
	}
	
	public ReplyVO worryQnA_Reply_Get(Long rno) {
		log.info("댓글 상세 조회! -------");
		return mapper.worryQnA_Read(rno);
	}
	
	public ReplyVO passSelfIntroduct_Reply_Get(Long rno) {
		log.info("댓글 상세 조회! -------");
		return mapper.passSelfIntroduct_Read(rno);
	}
	
	
	//==========댓글 1건 수정==========	
	@Override
	public int companyVal_Reply_TB_Modify(ReplyVO vo) {
		log.info("댓글 수정하기! -------");
		return mapper.companyVal_Update(vo);
	}
	
	@Override
	public int interviewAns_Reply_TB_Modify(ReplyVO vo) {
		log.info("댓글 수정하기! -------");
		return mapper.interviewAns_Update(vo);
	}
	
	@Override
	public int passLatter_Reply_TB_Modify(ReplyVO vo) {
		log.info("댓글 수정하기! -------");
		return mapper.passLatter_Update(vo);
	}
	
	@Override
	public int worryQnA_Reply_TB_Modify(ReplyVO vo) {
		log.info("댓글 수정하기! -------");
		return mapper.worryQnA_Update(vo);
	}
	
	@Override
	public int passSelfIntroduct_Reply_TB_Modify(ReplyVO vo) {
		log.info("댓글 수정하기! -------");
		return mapper.passSelfIntroduct_Update(vo);
	}
	
	
	//==========댓글 1건 삭제==========	
	@Transactional
	@Override
	public int companyVal_Remove(Long rno) {
		log.info("댓글 삭제하기! -----------");
		
		ReplyVO vo = mapper.companyVal_Read(rno);
		
		boardMapper.companyVal_TB_ReplyCnt(vo.getBno(), -1);
		
		return mapper.companyVal_Delete(rno);
	}
	
	@Transactional
	@Override
	public int interviewAns_Remove(Long rno) {
		log.info("댓글 삭제하기! -----------");
		
		ReplyVO vo = mapper.interviewAns_Read(rno);
		
		boardMapper.interviewAns_TB_ReplyCnt(vo.getBno(), -1);
		
		return mapper.interviewAns_Delete(rno);
	}
	
	@Transactional
	@Override
	public int passLatter_Remove(Long rno) {
		log.info("댓글 삭제하기! -----------");
		
		ReplyVO vo = mapper.passLatter_Read(rno);
		
		boardMapper.passLatter_TB_ReplyCnt(vo.getBno(), -1);
		
		return mapper.passLatter_Delete(rno);
	}
	
	@Transactional
	@Override
	public int worryQnA_Remove(Long rno) {
		log.info("댓글 삭제하기! -----------");
		
		ReplyVO vo = mapper.worryQnA_Read(rno);
		
		boardMapper.worryQnA_TB_ReplyCnt(vo.getBno(), -1);
		
		return mapper.worryQnA_Delete(rno);
	}
	
	@Transactional
	@Override
	public int passSelfIntroduct_Remove(Long rno) {
		log.info("댓글 삭제하기! -----------");
		
		ReplyVO vo = mapper.passSelfIntroduct_Read(rno);
		
		boardMapper.passSelfIntroduct_TB_ReplyCnt(vo.getBno(), -1);
		
		return mapper.passSelfIntroduct_Delete(rno);
	}
	
	
	//==========댓글 리스트 불러오기==========	
	@Override
	public List<ReplyVO> companyValPaging(Criteria cri, Long bno) {
		log.info("댓글 목록! ------------");
		return mapper.companyValPaging(cri, bno);
	}
	
	@Override
	public List<ReplyVO> interviewAnsPaging(Criteria cri, Long bno) {
		log.info("댓글 목록! ------------");
		return mapper.interviewAnsPaging(cri, bno);
	}
	
	@Override
	public List<ReplyVO> passLatterPaging(Criteria cri, Long bno) {
		log.info("댓글 목록! ------------");
		return mapper.passLatterPaging(cri, bno);
	}
	
	@Override
	public List<ReplyVO> worryQnAPaging(Criteria cri, Long bno) {
		log.info("댓글 목록! ------------");
		return mapper.worryQnAPaging(cri, bno);
	}
	
	@Override
	public List<ReplyVO> passSelfIntroductPaging(Criteria cri, Long bno) {
		log.info("댓글 목록! ------------");
		return mapper.passSelfIntroductPaging(cri, bno);
	}
	
	
	//==========선택한 페이지에 대한 댓글 목록 (댓글 페이지)==========	
	@Override
	public ReplyPageDTO companyVal_GetListPage(Criteria cri, Long bno) {
		log.info("댓글 목록 페이지 처리!");
		
		return new ReplyPageDTO(mapper.companyValCount(bno), //해당 bno에 달린 댓글의 개수
								mapper.companyValPaging(cri, bno)); //해당 페이지의 게시글을 가져와서 보여줌 
	}
	@Override
	public ReplyPageDTO interviewAns_GetListPage(Criteria cri, Long bno) {
		log.info("댓글 목록 페이지 처리!");
		
		return new ReplyPageDTO(mapper.interviewAnsCount(bno), //해당 bno에 달린 댓글의 개수
								mapper.interviewAnsPaging(cri, bno)); //해당 페이지의 게시글을 가져와서 보여줌 
	}
	
	@Override
	public ReplyPageDTO passLatter_GetListPage(Criteria cri, Long bno) {
		log.info("댓글 목록 페이지 처리!");
		
		return new ReplyPageDTO(mapper.passLatterCount(bno), //해당 bno에 달린 댓글의 개수
								mapper.passLatterPaging(cri, bno)); //해당 페이지의 게시글을 가져와서 보여줌 
	}
	
	@Override
	public ReplyPageDTO worryQnA_GetListPage(Criteria cri, Long bno) {
		log.info("댓글 목록 페이지 처리!");
		
		return new ReplyPageDTO(mapper.worryQnACount(bno), //해당 bno에 달린 댓글의 개수
								mapper.worryQnAPaging(cri, bno)); //해당 페이지의 게시글을 가져와서 보여줌 
	}
	
	@Override
	public ReplyPageDTO passSelfIntroduct_GetListPage(Criteria cri, Long bno) {
		log.info("댓글 목록 페이지 처리!");
		
		return new ReplyPageDTO(mapper.passSelfIntroductCount(bno), //해당 bno에 달린 댓글의 개수
								mapper.passSelfIntroductPaging(cri, bno)); //해당 페이지의 게시글을 가져와서 보여줌 
	}

}
