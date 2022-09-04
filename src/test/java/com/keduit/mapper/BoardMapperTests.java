package com.keduit.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.keduit.domain.BoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	
	@Test
	public void testinsert() {
		BoardVO vo = new BoardVO();
		
		log.info("insert............");
		
		vo.setTitle("제목1");
		vo.setContent("내용1");
		
	}
	
	
	@Test
	public void testDelete() {
		
		log.info("delete.................");
	}
	
	@Test
	public void testUpdate() {
		BoardVO vo = new BoardVO();
		
		log.info("update............");
		
		vo.setBno(5L);
		vo.setTitle("타이틀02");
		vo.setContent("내용02");
		
	}
	
	@Test
	public void testviews() {
		BoardVO vo = new BoardVO();
		
		log.info("view다............");
		
		vo.setViews("views");
		
	}
	
	@Test
	public void TestCompanyValupdateModify() {
		BoardVO vo = new BoardVO();
		vo.setBno(20L);
		vo.setTitle("수정");
	    vo.setContent("내용수정");
	    vo.setUserid("user2");
	    mapper.update(vo);
	}
	
	@Test
	public void TestWorryQnAinsert() {
		BoardVO vo = new BoardVO();
		vo.setTitle("제목");
		vo.setContent("내용");
		vo.setUserid("user8");
		vo.setCategory("고민거리");
		mapper.worryQnA_Insert(vo);
	}
	
	
}
