package com.keduit.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.keduit.domain.Criteria;
import com.keduit.domain.ReplyVO;

public interface ReplyMapper {
	
	//댓글 등록
	public int companyVal_Insert(ReplyVO vo);
	public int interviewAns_Insert(ReplyVO vo);
	public int passLatter_Insert(ReplyVO vo);
	public int worryQnA_Insert(ReplyVO vo);
	public int passSelfIntroduct_Insert(ReplyVO vo);
	
	//댓글 1건 확인(특정 게시글에 댓글이 달려있기 때문에 bno로 확인)
	public ReplyVO companyVal_Read(Long bno);
	public ReplyVO interviewAns_Read(Long bno);
	public ReplyVO passLatter_Read(Long bno);
	public ReplyVO worryQnA_Read(Long bno);
	public ReplyVO passSelfIntroduct_Read(Long bno);
	
	//댓글 삭제
	public int companyVal_Delete(Long rno);
	public int interviewAns_Delete(Long rno);
	public int passLatter_Delete(Long rno);
	public int worryQnA_Delete(Long rno);
	public int passSelfIntroduct_Delete(Long rno);
	
	//댓글 수정
	public int companyVal_Update(ReplyVO vo);
	public int interviewAns_Update(ReplyVO vo);
	public int passLatter_Update(ReplyVO vo);
	public int worryQnA_Update(ReplyVO vo);
	public int passSelfIntroduct_Update(ReplyVO vo);
	
	//댓글 리스트
	public List<ReplyVO> companyValPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
	public List<ReplyVO> interviewAnsPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
	public List<ReplyVO> passLatterPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
	public List<ReplyVO> worryQnAPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
	public List<ReplyVO> passSelfIntroductPaging(@Param("cri") Criteria cri, @Param("bno") Long bno);
	
	//특정 게시글에 달린 댓글의 개수
	public int companyValCount(Long bno);
	public int interviewAnsCount(Long bno);
	public int passLatterCount(Long bno);
	public int worryQnACount(Long bno);
	public int passSelfIntroductCount(Long bno);
	
}
