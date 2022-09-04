package com.keduit.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.keduit.domain.AskVO;
import com.keduit.domain.ReplyVO;
import com.keduit.service.AskService;
import com.keduit.service.BoardService;
import com.keduit.service.ReplyService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
public class AskController {
	
	private final AskService service;
	private final BoardService boardService;

	
	@GetMapping("/board/user/Ask/AskReg2")
	public void getAskReg() {
		log.info("Get방식 AskReg2...............");
	}
	
	@PostMapping("/board/user/Ask/AskReg")
	public String postAskReg(String userid, AskVO vo,HttpServletRequest request,RedirectAttributes rttr) {
		log.info("Post방식 AskReg...............");
		vo.setTitle(request.getParameter("title"));
		vo.setContent(request.getParameter("content"));
		vo.setCategory(request.getParameter("select"));
		vo.setUserid(request.getParameter("userid"));
		service.askRegister(vo);
		return "redirect:/board/user/mypage?userid="+userid;
	}
	
	@GetMapping("/board/user/mypage")
	public void getMyPage(String userid,Model model) {
		
		log.info("Get방식 Mypage...............");
		if(service.askList(userid).isEmpty() && boardService.readMyBoardList(userid).isEmpty()) {
			model.addAttribute("list","null");
			model.addAttribute("list2","null");
			log.info("list,list2 둘다 비어있음");
		}else if(!(boardService.readMyBoardList(userid).isEmpty()) &&  !(service.askList(userid).isEmpty())) {
			model.addAttribute("list",service.askList(userid));
			model.addAttribute("list2",boardService.readMyBoardList(userid));
			log.info("list,list2 둘다 있음");
		}else {
			log.info("list,list2 둘중 하나가 없다!!!! 그렇다면............누가 없니??");
			if(boardService.readMyBoardList(userid).isEmpty()) {
				model.addAttribute("list",service.askList(userid));
				model.addAttribute("list2","null");
				log.info("내가쓴 글이 없다는데............");
			}else if(service.askList(userid).isEmpty()) {
				model.addAttribute("list","null"); 
				model.addAttribute("list2",boardService.readMyBoardList(userid));
				log.info("내가쓴 문의한 글이 없다는데............");
			}
		}			
	}
	
	@GetMapping("/board/user/Ask/AskModify")
	public void getAskModify(Long bno,Model model) {
		log.info("Get방식 AskModify...............");
		model.addAttribute("board",service.askRead(bno));
		model.addAttribute("reply",service.readReplyList(bno));
	}
	
	@PostMapping("/board/user/Ask/AskModify")
	public String postAskModify(String userid,AskVO vo,RedirectAttributes rttr) {
		log.info("Post방식 AskModify...............");
		service.askModify(vo);
		return "redirect:/board/user/mypage?userid="+userid;
	}

	@PostMapping("/board/user/Ask/AskRemove")
	public String postAskRemove(String userid,Long bno,RedirectAttributes rttr) {
		log.info("Post방식 AskRemove...............");
		service.askRemove(bno);
		return "redirect:/board/user/index";
	}	
	
	@GetMapping("/board/admin/adminAsk")
	public void getAdminAsk(Model model) {
		log.info("Get방식 Admin Ask...............");
		model.addAttribute("list",service.totalAskList());
	}
	
	@PostMapping("/board/admin/adminAskRemove")
	public String postAdminAskRemove(String userid,Long bno,RedirectAttributes rttr) {
		log.info("Post방식 Admin AskRemove...............");
		service.askRemove(bno);
		return "redirect:/board/admin/adminAsk";
	}
	
	@GetMapping("/board/admin/adminAsk-Modify")
	public void getAdminAskModify(Long rno,Model model) {
		log.info("Get방식 adminAsk-Modify...............");
		model.addAttribute("reply",service.readReply(rno));
	}
		
	@PostMapping("/replies/remove")
	public String postRemove(ReplyVO vo, Long rno) {
		log.info("Post방식 Remove...............");
		service.removeReply(rno);
		return "redirect:/board/user/Ask/AskModify?bno="+vo.getBno();
	}

	@PostMapping("/replies/modify")
	public String postModify(ReplyVO vo, Long rno) {
		log.info("Post방식 Modify...............");
		service.modifyReply(vo);
		return"redirect:/board/user/Ask/AskModify?bno="+vo.getBno();
	}
	
	
	@PostMapping("/replies/userWrite")
	public String postUserWrite(ReplyVO vo) {
		service.register(vo);
		return "redirect:/board/user/Ask/AskModify?bno="+vo.getBno();
	}
	
}
