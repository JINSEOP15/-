package com.keduit.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private Long rno, bno;
	private String reply, userid;
	private Date regdate;
	
}
