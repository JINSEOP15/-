package com.keduit.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		log.warn("login Success");
		
		List<String> roleNames = new ArrayList<>();
		
		//Authentication객체를 이용해 사용자가 가진 모든 권한을 문자열로 체크한다.
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		
		log.warn("권한이 뭐니??"+roleNames);
		
		if(roleNames.contains("ROLE_USER")) {
			response.sendRedirect("/board/user/index");
			return;
		}
		
		if(roleNames.contains("ROLE_ADMIN")) {
			response.sendRedirect("/board/user/index");
			return;
		}
		response.sendRedirect("/");
		
	}

}
