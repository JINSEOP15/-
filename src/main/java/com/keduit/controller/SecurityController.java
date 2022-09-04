package com.keduit.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/board/user/*")
public class SecurityController {
	
	@GetMapping("/login")
	public void getLogin() {
		log.info("Get방식 login.....................");
	}
	
	@PostMapping("/login")
	public void postLogin() {
		log.info("Post방식 login....................");
	}
	
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth,Model model) {
		log.info("access Denied(누가접근했닝?):" + auth);
		model.addAttribute("msg","model에 담겨진 메세지거등요");
	}
	
	@GetMapping("/logout")
	public void getLogout() {
		log.info("get방식 logout.....................");
	}

	@PostMapping("/customLogout")
	public void postLogout() {
		log.info("Post방식 logout....................");
	}
	

}
