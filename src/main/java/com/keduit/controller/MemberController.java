package com.keduit.controller;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.keduit.domain.MemberVO;
import com.keduit.domain.MemberVO2;
import com.keduit.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
public class MemberController {
	private final MemberService service;
	private final PasswordEncoder pwencoder;
	

	@GetMapping("/board/user/sign")
	public void GetSign() {
	}
	
	@ResponseBody
	@GetMapping("/board/user/sign/idCheck") // 아이디 중복확인을 위한 값으로 따로 매핑
	public int overLappingID(@RequestParam("userid") String userid) throws Exception{
			int data = service.overLappingID(userid); 
			return data;
		}
		
	@PostMapping("/board/user/sign")
	public String postSign(MemberVO2 vo2,RedirectAttributes rttr) {
		vo2.setUserpw(pwencoder.encode(vo2.getUserpw()));
		service.memberRegister(vo2);
		
		return "redirect:/board/user/index";
	}
	
	@GetMapping("/board/admin/management")
	public void getManagement(Model model) {
		model.addAttribute("list",service.readMemberList());
	}
	
	@GetMapping("/board/admin/member-detail")
	public void getMemberDetail(String userid, Model model) {
		model.addAttribute("member", service.memberRead(userid));
	}

	
	@PostMapping("/board/admin/memberModify")
	public String postMemberModify(MemberVO2 vo2,RedirectAttributes rttr) {
		int count=service.memberModify(vo2);
		return "redirect:/board/admin/management";
	}
	
	@PostMapping("/board/admin/memberRemove")
	public String postMemberRemove(String userid, Model model) {
		int count=service.memberRemove(userid);
		return "redirect:/board/admin/management";
	}
	
	@PostMapping("/board/user/userModify")
	public String postUserModify(MemberVO2 vo2,RedirectAttributes rttr) {
		int count=service.memberModify(vo2);
		return "redirect:/board/user/edit?userid="+vo2.getUserid();
	}
	
	@PostMapping("/board/user/userRemove")
	public String postUserRemove(String userid, Model model) {
		int count=service.memberRemove(userid);
		return "redirect:/customLogout";
	}
	
	@GetMapping("/board/user/edit")
	public void getEdit(String userid, Model model) {
		model.addAttribute("member", service.memberRead(userid));
	}
	
	@GetMapping("/board/user/withdrawal")
	public void getWithdrawal(String userid, Model model) {
	}
	
	
	
}
