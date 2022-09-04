package com.keduit.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class MemberVO {
	
	private String userid;
	private String userpw;
	private String userName;
	private String userphone;
	private Date regdate;
	private Date updatedate;
	private boolean enabled;
	
	private String pwdcheck;
	
	private List<AuthVO> authList;
}

