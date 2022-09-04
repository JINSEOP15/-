package com.keduit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO2 {

	private String userid;
	private String userpw;
	private String username;
	private String userphone;
	private Date regdate;
	private Date updatedate;
	private boolean enabled;

}
