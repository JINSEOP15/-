package com.keduit.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.keduit.domain.BoardVO;
import com.keduit.domain.Criteria;
import com.keduit.domain.PageDTO;
import com.keduit.service.BoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/board/user/*")
public class BoardController {
	
	private final BoardService service;
	
	@GetMapping("/index")
	public void index(Criteria cri, Model model) {
		cri.setAmount(10);
		model.addAttribute("CompanyVal",service.companyValViewsList(cri));
		model.addAttribute("InterviewAns",service.interviewAnsViewsList(cri));
	}
	
	
	//--------------------리스트 불러오기-------------------------------
	@GetMapping("/CompanyVal/community")
	public void companyVal(Criteria cri, Model model) {
		model.addAttribute("CompanyVal",service.companyValPaging(cri));
		int total = service.companyValTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}	
	@GetMapping("/InterviewAns/community")
	public void interviewAns(Criteria cri, Model model) {
		model.addAttribute("InterviewAns",service.interviewAnsPaging(cri));
		int total = service.interviewAnsTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}	
	@GetMapping("/Passlatter/community")
	public void passLatter(Criteria cri, Model model) {
		model.addAttribute("Passlatter",service.passLatterPaging(cri));
		int total = service.passLatterTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}	
	@GetMapping("/WorryQnA/community")
	public void worryQnA(Criteria cri, Model model) {
		model.addAttribute("WorryQnA",service.worryQnAPaging(cri));
		int total = service.worryQnATotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}	
	@GetMapping("/PassSelfIntroduct/community")
	public void passSelfIntroduct(Criteria cri, Model model) {
		model.addAttribute("PassSelfIntroduct",service.passSelfIntroductPaging(cri));
		int total = service.passSelfIntroductTotal(cri);
		model.addAttribute("pageMaker", new PageDTO(cri,total));
	}
	
	
	//--------------------조회수 버튼을 눌렀을 경우-------------------------------
	@PostMapping("/{tablename}/community")
	public void Views(Criteria cri, Model model, BoardVO vo) {
		cri.setTable("Views");

		if(vo.getTablename().equals("CompanyVal")) {
			model.addAttribute("CompanyVal",service.companyValPaging(cri));
			int total = service.companyValTotal(cri);
			model.addAttribute("pageMaker", new PageDTO(cri,total));
		} else if(vo.getTablename().equals("InterviewAns")) {
			model.addAttribute("InterviewAns",service.interviewAnsPaging(cri));
			int total = service.interviewAnsTotal(cri);
			model.addAttribute("pageMaker", new PageDTO(cri,total));
		} else if(vo.getTablename().equals("Passlatter")) {
			model.addAttribute("Passlatter",service.passLatterPaging(cri));
			int total = service.passLatterTotal(cri);
			model.addAttribute("pageMaker", new PageDTO(cri,total));
		} else if(vo.getTablename().equals("WorryQnA")) {
			model.addAttribute("WorryQnA",service.worryQnAPaging(cri));
			int total = service.worryQnATotal(cri);
			model.addAttribute("pageMaker", new PageDTO(cri,total));
		} else if(vo.getTablename().equals("PassSelfIntroduct")) {
			model.addAttribute("PassSelfIntroduct",service.passSelfIntroductPaging(cri));
			int total = service.passSelfIntroductTotal(cri);
			model.addAttribute("pageMaker", new PageDTO(cri,total));
		}
	}	
	
	
	//--------------------좋아요 버튼을 눌렀을 경우-------------------------------	
	@PostMapping("/{tablename}/community2")
	public void Likes(Criteria cri, Model model, BoardVO vo) {
		cri.setTable("Likes");
		
		if(vo.getTablename().equals("CompanyVal")) {
			model.addAttribute("CompanyVal",service.companyValPaging(cri));
			int total = service.companyValTotal(cri);
			model.addAttribute("pageMaker", new PageDTO(cri,total));
		} else if(vo.getTablename().equals("InterviewAns")) {
			model.addAttribute("InterviewAns",service.interviewAnsPaging(cri));
			int total = service.interviewAnsTotal(cri);
			model.addAttribute("pageMaker", new PageDTO(cri,total));
		} else if(vo.getTablename().equals("Passlatter")) {
			model.addAttribute("Passlatter",service.passLatterPaging(cri));
			int total = service.passLatterTotal(cri);
			model.addAttribute("pageMaker", new PageDTO(cri,total));
		} else if(vo.getTablename().equals("WorryQnA")) {
			model.addAttribute("WorryQnA",service.worryQnAPaging(cri));
			int total = service.worryQnATotal(cri);
			model.addAttribute("pageMaker", new PageDTO(cri,total));
		} else if(vo.getTablename().equals("PassSelfIntroduct")) {
			model.addAttribute("PassSelfIntroduct",service.passSelfIntroductPaging(cri));
			int total = service.passSelfIntroductTotal(cri);
			model.addAttribute("pageMaker", new PageDTO(cri,total));
		}
	}	
	
	
	//--------------------게시글 상세화면 1건 조회하기-------------------------------	
	@GetMapping({"/CompanyVal/reg-detail", "/CompanyVal/modify"})
	public void companyValRegdetail(Model model, BoardVO vo) {
		vo.setTablename("CompanyVal");
		service.ViewCount(vo);
		model.addAttribute("board", service.get(vo));
	}	
	@GetMapping({"/InterviewAns/reg-detail", "/InterviewAns/modify"})
	public void interviewAnsRegdetail(Model model, BoardVO vo) {
		vo.setTablename("InterviewAns");
		service.ViewCount(vo);
		model.addAttribute("board", service.get(vo));
	}	
	@GetMapping({"/Passlatter/reg-detail", "/Passlatter/modify"})
	public void passLatterRegdetail(Model model, BoardVO vo) {
		vo.setTablename("Passlatter");
		service.ViewCount(vo);
		model.addAttribute("board", service.get(vo));
	}	
	@GetMapping({"/WorryQnA/reg-detail", "/WorryQnA/modify"})
	public void worryQnARegdetail(Model model, BoardVO vo) {
		vo.setTablename("WorryQnA");
		service.ViewCount(vo);
		model.addAttribute("board", service.get(vo));
	}	
	@GetMapping({"/PassSelfIntroduct/reg-detail", "/PassSelfIntroduct/modify"})
	public void passSelfIntroductRegdetail(Model model, BoardVO vo) {
		vo.setTablename("PassSelfIntroduct");
		service.ViewCount(vo);
		model.addAttribute("board", service.get(vo));
	}

	
//--------------------게시물 좋아요 클릭시 좋아요 증가부분---------------	
	@PostMapping("/{tablename}/reg-detail2")
	public void regdetailLikes(Model model, BoardVO vo) {
		service.LikeCount(vo);
		model.addAttribute("board", service.get(vo));
	}

	
//--------------------다음글 버튼 클릭 시 페이지 이동------------------
	@PostMapping("/{tablename}/reg-detail")
	public void regdetailPlus(Model model, BoardVO vo) {		
			service.ViewCount(vo);
			model.addAttribute("board", service.GetPluse(vo));	
	}	
	
	
//--------------------게시글 등록화면-------------------------------	
	@GetMapping("/{tablename}/reg")
	public void reg(Model model) {
	}
	
	
//--------------------게시글 1건 등록하기---------------------------	
	@PostMapping("/{select}/reg")
	public String register(BoardVO vo, RedirectAttributes rttr) {
		log.info("이거 select 값 --> " + vo.getSelect());
		Long bno = service.register(vo);		
		rttr.addFlashAttribute("result",vo.getBno());		
		return "redirect:/board/user/{select}/community";
	}	
	
	@PostMapping("/WorryQnA/regQnA")
	public String worryQnARegister(BoardVO vo, RedirectAttributes rttr, HttpServletRequest request) {
		log.info("WorryQnAregister...............");		
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		vo.setUserid(request.getParameter("userid"));
		vo.setCategory(request.getParameter("select2"));
		Long bno = service.worryQnA_Register(vo);		
		rttr.addFlashAttribute("result",vo.getBno());		
		return "redirect:/board/user/WorryQnA/community";
	}
	
	
	//--------------------게시글 1건 수정하기-------------------------------	
	 @PostMapping("/{tablename}/modify") 
	 public String modify(BoardVO vo, RedirectAttributes rttr) { 
		 int count = service.modify(vo);
		 
		 //1건 수정이 정상적으로 작동 되었을 경우
		 if(count == 1) {
		 rttr.addFlashAttribute("result","success");
		 }	 
		 return "redirect:/board/user/{tablename}/reg-detail?bno=" + vo.getBno();
	 }	 
	
	 
		//--------------------게시글 1건 삭제하기-------------------------------	
	 @PostMapping("/{tablename}/remove") 
	 public String remove(RedirectAttributes rttr, BoardVO vo) {
		 int count = service.remove(vo);
		 
		 //1건 삭제가 정상적으로 작동 되었을 경우 
		 if(count == 1) {
	     rttr.addFlashAttribute("result","success");
		 }
		 return "redirect:/board/user/{tablename}/community";
	 }	
}