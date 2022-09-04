package com.keduit.service;

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
public class BoardServiseTests {
	
	@Setter(onMethod_ = @Autowired)
	private BoardService service;
	
	@Test
	public void testPrint() {
		log.info(service);
	}
	
	
	@Test
	public void test() {
		BoardVO vo = new BoardVO();
		vo.setBno(1L);
		vo.setUserid("nana");
		vo.setContent("시러");
		vo.setTitle("tlfxkrh");
		log.info(service.modify(vo));
	}
	/*
	 * @Test public void testGetList() { log.info("get list.........");
	 * 
	 * service.getlist(); }
	 */

}
