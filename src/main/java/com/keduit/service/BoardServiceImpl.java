package com.keduit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.keduit.domain.BoardVO;
import com.keduit.domain.Criteria;
import com.keduit.domain.MemberVO;
import com.keduit.mapper.BoardMapper;
import com.keduit.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper member;

	
	//==========게시글 새 글 작성==========	
	@Override
	public Long register(BoardVO vo) {
		mapper.insert(vo);
		return vo.getBno();
	}
	@Override
	public Long worryQnA_Register(BoardVO vo) {
		mapper.worryQnA_Insert(vo);
		return vo.getBno();
	}

	
	//==========1건 조회 get (글 상세보기)==========
	@Override
	public BoardVO get(BoardVO vo) {
		return mapper.read(vo);
	}

	
	//다음글 버튼 클릭 시 페이지 이동
	@Override
	public BoardVO GetPluse(BoardVO vo) {
		return mapper.ReadPluse(vo);
	}
	
	
	//==========게시판 1건 수정하기==========
	@Override
	public int modify(BoardVO vo) {
		return mapper.update(vo);
	}

	
	//==========게시판 1건 삭제하기==========	
	@Override
	public int remove(BoardVO vo) {	
		return mapper.delete(vo);
	}
	
	
	//==========페이징 처리하기==========	
	@Override
	public int companyValTotal(Criteria cri) {		
		return mapper.companyValTotalCount(cri);
	}
	@Override
	public int interviewAnsTotal(Criteria cri) {		
		return mapper.interviewAnsTotalCount(cri);
	}
	@Override
	public int passLatterTotal(Criteria cri) {	
		return mapper.passLatterTotalCount(cri);
	}
	@Override
	public int worryQnATotal(Criteria cri) {	
		return mapper.worryQnATotalCount(cri);
	}
	@Override
	public int passSelfIntroductTotal(Criteria cri) {
		return mapper.passSelfIntroductTotalCount(cri);
	}
	
	
	// ==========각 게시판list 불러오는 부분==========
	@Override
	public List<BoardVO> companyValPaging(Criteria cri) {	
		return mapper.companyValPaging(cri);
	}
	@Override
	public List<BoardVO> interviewAnsPaging(Criteria cri) {
		return mapper.interviewAnsPaging(cri);
	}
	@Override
	public List<BoardVO> passLatterPaging(Criteria cri) {	
		return mapper.passLatterPaging(cri);
	}
	@Override
	public List<BoardVO> worryQnAPaging(Criteria cri) {	
		return mapper.worryQnAPaging(cri);
	}
	@Override
	public List<BoardVO> passSelfIntroductPaging(Criteria cri) {	
		return mapper.passSelfIntroductPaging(cri);
	}

	
	//좋아요수에 따른 list
	@Override
	public List<BoardVO> companyValViewsList(Criteria cri) {	
		return mapper.companyValViewsPaging(cri);
	}
	@Override
	public List<BoardVO> interviewAnsViewsList(Criteria cri) {	
		return mapper.interviewAnsViewsPaging(cri);
	}

	
	//게시물 들어가면 조회수 증가부분
	@Override
	public int ViewCount(BoardVO vo) {
		return mapper.ViewCount(vo);
	}

	
	//게시물 좋아요 클릭시 좋아요 증가부분	
	@Override
	public int LikeCount(BoardVO vo) {
		return mapper.LikeCount(vo);
	}

	
	//나의 최신글 list 뽑아내기
	@Override
	public List<BoardVO> readMyBoardList(String userid) {
		return mapper.getMyBoardList(userid);
	}
	
	
	//==========게시글에 보여지는 댓글 카운트==========
	@Override
	public void companyVal_TB_ReplyCnt(Long bno, int amount) {
		mapper.companyVal_TB_ReplyCnt(bno, amount);
	}
	@Override
	public void interviewAns_TB_ReplyCnt(Long bno, int amount) {
		mapper.interviewAns_TB_ReplyCnt(bno, amount);
	}
	@Override
	public void passLatter_TB_ReplyCnt(Long bno, int amount) {
		mapper.passLatter_TB_ReplyCnt(bno, amount);
	}
	@Override
	public void worryQnA_TB_ReplyCnt(Long bno, int amount) {
		mapper.worryQnA_TB_ReplyCnt(bno, amount);
	}
	@Override
	public void passSelfIntroduct_TB_ReplyCnt(Long bno, int amount) {
		mapper.passSelfIntroduct_TB_ReplyCnt(bno, amount);
	}
}
