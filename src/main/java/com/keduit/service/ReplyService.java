package com.keduit.service;

import java.util.List;

import com.keduit.domain.Criteria;
import com.keduit.domain.ReplyPageDTO;
import com.keduit.domain.ReplyVO;

public interface ReplyService {
	
	//댓글 작성
	public int companyVal_Reply_TB_Reg(ReplyVO vo);
	public int interviewAns_Reply_TB_Reg(ReplyVO vo);
	public int passLatter_Reply_TB_Reg(ReplyVO vo);
	public int worryQnA_Reply_TB_Reg(ReplyVO vo);
	public int passSelfIntroduct_Reply_TB_Reg(ReplyVO vo);
	
	//특정 댓글 조회
	public ReplyVO companyVal_Reply_Get(Long rno);
	public ReplyVO interviewAns_Reply_Get(Long rno);
	public ReplyVO passLatter_Reply_Get(Long rno);
	public ReplyVO worryQnA_Reply_Get(Long rno);
	public ReplyVO passSelfIntroduct_Reply_Get(Long rno);
	
	//댓글 수정하기
	public int companyVal_Reply_TB_Modify(ReplyVO vo);
	public int interviewAns_Reply_TB_Modify(ReplyVO vo);
	public int passLatter_Reply_TB_Modify(ReplyVO vo);
	public int worryQnA_Reply_TB_Modify(ReplyVO vo);
	public int passSelfIntroduct_Reply_TB_Modify(ReplyVO vo);
	
	//댓글 삭제하기
	public int companyVal_Remove(Long rno);
	public int interviewAns_Remove(Long rno);
	public int passLatter_Remove(Long rno);
	public int worryQnA_Remove(Long rno);
	public int passSelfIntroduct_Remove(Long rno);
	
	//댓글 list 불러오기
	public List<ReplyVO> companyValPaging(Criteria cri, Long bno);
	public List<ReplyVO> interviewAnsPaging(Criteria cri, Long bno);
	public List<ReplyVO> passLatterPaging(Criteria cri, Long bno);
	public List<ReplyVO> worryQnAPaging(Criteria cri, Long bno);
	public List<ReplyVO> passSelfIntroductPaging(Criteria cri, Long bno);
	
	//선택한 페이지에 대한 댓글 목록 (댓글 페이지)
	public ReplyPageDTO companyVal_GetListPage(Criteria cri, Long bno);
	public ReplyPageDTO interviewAns_GetListPage(Criteria cri, Long bno);
	public ReplyPageDTO passLatter_GetListPage(Criteria cri, Long bno);
	public ReplyPageDTO worryQnA_GetListPage(Criteria cri, Long bno);
	public ReplyPageDTO passSelfIntroduct_GetListPage(Criteria cri, Long bno);
}
