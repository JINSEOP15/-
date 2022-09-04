package com.keduit.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.keduit.domain.BoardVO;
import com.keduit.domain.Criteria;
import com.keduit.domain.MemberVO;

public interface BoardService {
	//새 글 작성
	public Long register(BoardVO vo);
	public Long worryQnA_Register(BoardVO vo);
	
	//1건 조회 (상세보기)
	public BoardVO get(BoardVO vo);
	
	//다음글 버튼 클릭 시 페이지 이동
	public BoardVO GetPluse(BoardVO vo);
	
	//페이지 관련
	public List<BoardVO> companyValPaging(Criteria cri);
	public List<BoardVO> interviewAnsPaging(Criteria cri);
	public List<BoardVO> passLatterPaging(Criteria cri);
	public List<BoardVO> worryQnAPaging(Criteria cri);
	public List<BoardVO> passSelfIntroductPaging(Criteria cri);
	
	//1건 수정하기
	public int modify(BoardVO vo);
	
	//1건 삭제하기
	public int remove(BoardVO vo);
	
	//검색한 데이터 불러오기
	public int companyValTotal(Criteria cri);
	public int interviewAnsTotal(Criteria cri);
	public int passLatterTotal(Criteria cri);
	public int worryQnATotal(Criteria cri);
	public int passSelfIntroductTotal(Criteria cri);

	//조회수에 따른 list
	public List<BoardVO> companyValViewsList(Criteria cri);
	public List<BoardVO> interviewAnsViewsList(Criteria cri);
	
	//게시물 들어갈 때마다 조회수 증가 메서드 
	public int ViewCount(BoardVO vo);
	
	//게시물 좋아요 클릭시 좋아요 증가 메서드
	public int LikeCount(BoardVO vo);
	
	//나의 최신글 list 뽑아내기
	public List<BoardVO> readMyBoardList(String userid);
	
	//게시글에 보여지는 댓글 카운트
	public void companyVal_TB_ReplyCnt(@Param ("bno") Long bno, @Param("amount") int amount);
	public void interviewAns_TB_ReplyCnt(@Param ("bno") Long bno, @Param("amount") int amount);
	public void passLatter_TB_ReplyCnt(@Param ("bno") Long bno, @Param("amount") int amount);
	public void worryQnA_TB_ReplyCnt(@Param ("bno") Long bno, @Param("amount") int amount);
	public void passSelfIntroduct_TB_ReplyCnt(@Param ("bno") Long bno, @Param("amount") int amount);
}
