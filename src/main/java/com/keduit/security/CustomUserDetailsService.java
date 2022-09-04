package com.keduit.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.keduit.domain.MemberVO;
import com.keduit.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	
	@Setter(onMethod_=@Autowired)
	private MemberMapper member;
	
	
	@Override
	public UserDetails loadUserByUsername(String userName) throws UsernameNotFoundException {
		log.warn("userName은 ??"+userName);
		
		MemberVO vo = member.read(userName);
		
		log.warn("member mapper은 ???"+vo);
		
		return vo==null ? null: new CustomUser(vo);
	}

}
