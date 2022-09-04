package com.keduit.domain;

import lombok.Data;

// 페이지 개수를 보여주기 위한 클래스
@Data
public class PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	private int total;
	private Criteria cri;
	private int nextNum;
	
	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		//마지막 페이지 먼저 계산(해당 마지막페이지는 10페이지씩 자르기 위한 것)
		this.endPage = (int)(Math.ceil(cri.getPageNum()/10.0))*10;
		
		//시작 페이지 계산
		this.startPage = this.endPage-9;
		
		//realEndPage 계산(정확한 마지막 페이지)
		//total에 1.0을 곱하는 이유는 소수점을 만들기 위한 것
		int realEnd = (int)(Math.ceil((total*1.0)/cri.getAmount()));
		
		//realEnd가 endPage보다 작거나 같으면 endPage => realEnd
		this.endPage = realEnd <= endPage? realEnd : endPage;
		
		//다음
		this.next = this.endPage < realEnd;
		
		//이전(시작 페이지가 1보다 클 경우 이전 페이지 존재)
		this.prev = this.startPage > 1;
		
	}
}
