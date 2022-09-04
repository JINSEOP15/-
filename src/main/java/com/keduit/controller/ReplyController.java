package com.keduit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.keduit.domain.Criteria;
import com.keduit.domain.ReplyPageDTO;
import com.keduit.domain.ReplyVO;
import com.keduit.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RequestMapping("/replies/")
@RestController //@Controller에 @ResponseBody가 추가 된 것
//json 형태로 객체를 반환한다. / 객체를 ResponseEntity로 감싸서 반환한다.
@Log4j
@AllArgsConstructor
public class ReplyController {
	
	@Setter(onMethod_=@Autowired)
	private ReplyService service;
	
	//댓글 등록
	@PostMapping(value = "/CompanyVal/creat",
			consumes = "application/json", //json 타입의 형태로 입력해서 
			produces = {MediaType.TEXT_PLAIN_VALUE}) //response 타입은 text로 return

	public ResponseEntity<String> companyVal_Reply_Create(@RequestBody ReplyVO vo){
		//@RequestBody : 데이터를 반환하기 위해 사용
		log.info("create..........ReplyVO"+vo);
		int insertCount = service.companyVal_Reply_TB_Reg(vo);
		log.info("댓글 입력 count => "+insertCount);
		
		//insertCount == 1은 댓글 1줄이 등록 되었다는 뜻
		//댓글이 등록 되면
		return insertCount == 1?
				new ResponseEntity<String>("success", HttpStatus.OK) // insertCount == 1
			   :new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR); //insertCount != 1
	}
	
	@PostMapping(value = "/InterviewAns/creat",
			consumes = "application/json", //json 타입의 형태로 입력해서 
			produces = {MediaType.TEXT_PLAIN_VALUE}) //response 타입은 text로 return

	public ResponseEntity<String> interviewAns_Reply_Create(@RequestBody ReplyVO vo){
		//@RequestBody : 데이터를 반환하기 위해 사용
		log.info("create..........ReplyVO"+vo);
		int insertCount = service.interviewAns_Reply_TB_Reg(vo);
		log.info("댓글 입력 count => "+insertCount);
		
		//insertCount == 1은 댓글 1줄이 등록 되었다는 뜻
		//댓글이 등록 되면
		return insertCount == 1?
				new ResponseEntity<String>("success", HttpStatus.OK) // insertCount == 1
				:new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR); //insertCount != 1	
	}
	
	@PostMapping(value = "/Passlatter/creat",
			consumes = "application/json", //json 타입의 형태로 입력해서 
			produces = {MediaType.TEXT_PLAIN_VALUE}) //response 타입은 text로 return
	
	public ResponseEntity<String> passLatter_Reply_Create(@RequestBody ReplyVO vo){
		//@RequestBody : 데이터를 반환하기 위해 사용
		log.info("create..........ReplyVO"+vo);
		int insertCount = service.passLatter_Reply_TB_Reg(vo);
		log.info("댓글 입력 count => "+insertCount);
		
		//insertCount == 1은 댓글 1줄이 등록 되었다는 뜻
		//댓글이 등록 되면
		return insertCount == 1?
				new ResponseEntity<String>("success", HttpStatus.OK) // insertCount == 1
				:new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR); //insertCount != 1
	}
	
	@PostMapping(value = "/PassSelfIntroduct/creat",
			consumes = "application/json", //json 타입의 형태로 입력해서 
			produces = {MediaType.TEXT_PLAIN_VALUE}) //response 타입은 text로 return
	
	public ResponseEntity<String> passSelfIntroduct_Reply_Create(@RequestBody ReplyVO vo){
		//@RequestBody : 데이터를 반환하기 위해 사용
		log.info("create..........ReplyVO"+vo);
		int insertCount = service.passSelfIntroduct_Reply_TB_Reg(vo);
		log.info("댓글 입력 count => "+insertCount);
		
		//insertCount == 1은 댓글 1줄이 등록 되었다는 뜻
		//댓글이 등록 되면
		return insertCount == 1?
				new ResponseEntity<String>("success", HttpStatus.OK) // insertCount == 1
				:new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR); //insertCount != 1
	}
	
	@PostMapping(value = "/WorryQnA/creat",
			consumes = "application/json", //json 타입의 형태로 입력해서 
			produces = {MediaType.TEXT_PLAIN_VALUE}) //response 타입은 text로 return
	
	public ResponseEntity<String> worryQnA_Reply_Create(@RequestBody ReplyVO vo){
		//@RequestBody : 데이터를 반환하기 위해 사용
		log.info("create..........ReplyVO"+vo);
		int insertCount = service.worryQnA_Reply_TB_Reg(vo);
		log.info("댓글 입력 count => "+insertCount);
		
		//insertCount == 1은 댓글 1줄이 등록 되었다는 뜻
		//댓글이 등록 되면
		return insertCount == 1?
				new ResponseEntity<String>("success", HttpStatus.OK) // insertCount == 1
				:new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR); //insertCount != 1
	}
	
	//댓글 페이지에 따른 목록
	@GetMapping(value = "/CompanyVal/pages/{bno}/{page}",
			produces = {MediaType.APPLICATION_XML_VALUE,
						MediaType.APPLICATION_JSON_VALUE}) //response타입이 xml, json 타입일 경우에 return
	public ResponseEntity<ReplyPageDTO> companyVal_GetList(@PathVariable("page") int page,
												@PathVariable("bno") Long bno){
		
		log.info("reply getlist............."+page+","+bno);
		
		Criteria cri = new Criteria(page, 10);
		log.info(cri);
		
		return new ResponseEntity<ReplyPageDTO>(service.companyVal_GetListPage(cri, bno), HttpStatus.OK);
	}
	
	@GetMapping(value = "/InterviewAns/pages/{bno}/{page}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE}) //response타입이 xml, json 타입일 경우에 return
	public ResponseEntity<ReplyPageDTO> interviewAns_GetList(@PathVariable("page") int page,
			@PathVariable("bno") Long bno){
		
		log.info("reply getlist............."+page+","+bno);
		
		Criteria cri = new Criteria(page, 10);
		log.info(cri);
		
		return new ResponseEntity<ReplyPageDTO>(service.interviewAns_GetListPage(cri, bno), HttpStatus.OK);
	}
	
	@GetMapping(value = "/Passlatter/pages/{bno}/{page}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE}) //response타입이 xml, json 타입일 경우에 return
	public ResponseEntity<ReplyPageDTO> passLatter_GetList(@PathVariable("page") int page,
			@PathVariable("bno") Long bno){
		
		log.info("reply getlist............."+page+","+bno);
		
		Criteria cri = new Criteria(page, 10);
		log.info(cri);
		
		return new ResponseEntity<ReplyPageDTO>(service.passLatter_GetListPage(cri, bno), HttpStatus.OK);
	}
	
	@GetMapping(value = "/PassSelfIntroduct/pages/{bno}/{page}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE}) //response타입이 xml, json 타입일 경우에 return
	public ResponseEntity<ReplyPageDTO> passSelfIntroduct_GetList(@PathVariable("page") int page,
			@PathVariable("bno") Long bno){
		
		log.info("reply getlist............."+page+","+bno);
		
		Criteria cri = new Criteria(page, 10);
		log.info(cri);
		
		return new ResponseEntity<ReplyPageDTO>(service.passSelfIntroduct_GetListPage(cri, bno), HttpStatus.OK);
	}
	
	@GetMapping(value = "/WorryQnA/pages/{bno}/{page}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE}) //response타입이 xml, json 타입일 경우에 return
	public ResponseEntity<ReplyPageDTO> worryQnA_GetList(@PathVariable("page") int page,
			@PathVariable("bno") Long bno){
		
		log.info("reply getlist............."+page+","+bno);
		
		Criteria cri = new Criteria(page, 10);
		log.info(cri);
		
		return new ResponseEntity<ReplyPageDTO>(service.worryQnA_GetListPage(cri, bno), HttpStatus.OK);
	}
	
	//댓글 1개 가져오기
	@GetMapping(value ="/CompanyVal/{rno}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReplyVO> companyVal_Get(@PathVariable("rno") Long rno){
		
		log.info("reply get............"+rno);
		
		return new ResponseEntity<ReplyVO>(service.companyVal_Reply_Get(rno), HttpStatus.OK);
	}
	
	@GetMapping(value ="/InterviewAns/{rno}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReplyVO> interviewAns_Get(@PathVariable("rno") Long rno){
		
		log.info("reply get............"+rno);
		
		return new ResponseEntity<ReplyVO>(service.interviewAns_Reply_Get(rno), HttpStatus.OK);
	}
	
	@GetMapping(value ="/Passlatter/{rno}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReplyVO> passLatter_Get(@PathVariable("rno") Long rno){
		
		log.info("reply get............"+rno);
		
		return new ResponseEntity<ReplyVO>(service.passLatter_Reply_Get(rno), HttpStatus.OK);
	}
	
	@GetMapping(value ="/PassSelfIntroduct/{rno}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReplyVO> passSelfIntroduct_Get(@PathVariable("rno") Long rno){
		
		log.info("reply get............"+rno);
		
		return new ResponseEntity<ReplyVO>(service.passSelfIntroduct_Reply_Get(rno), HttpStatus.OK);
	}
	
	@GetMapping(value ="/WorryQnA/{rno}",
			produces = {MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_VALUE})
	public ResponseEntity<ReplyVO> worryQnA_Get(@PathVariable("rno") Long rno){
		
		log.info("reply get............"+rno);
		
		return new ResponseEntity<ReplyVO>(service.worryQnA_Reply_Get(rno), HttpStatus.OK);
	}
	
	//댓글 1건 삭제
	//@DeleteMapping : Delete를 위한 Http(s)요청 처리 어노테이션
	@DeleteMapping(value ="/CompanyVal/{rno}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> companyVal_Remove(@PathVariable("rno") Long rno){
		
		log.info("remove............"+rno);
		
		int removeCount = service.companyVal_Remove(rno);
		return removeCount == 1?
				new ResponseEntity<String>("댓글을 삭제했습니다", HttpStatus.OK)
			   :new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value ="/InterviewAns/{rno}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> interviewAns_Remove(@PathVariable("rno") Long rno){
		
		log.info("remove............"+rno);
		
		int removeCount = service.interviewAns_Remove(rno);
		return removeCount == 1?
				new ResponseEntity<String>("댓글을 삭제했습니다", HttpStatus.OK)
				:new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value ="/Passlatter/{rno}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> passLatter_Remove(@PathVariable("rno") Long rno){
		
		log.info("remove............"+rno);
		
		int removeCount = service.passLatter_Remove(rno);
		return removeCount == 1?
				new ResponseEntity<String>("댓글을 삭제했습니다", HttpStatus.OK)
				:new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value ="/PassSelfIntroduct/{rno}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> passSelfIntroduct_Remove(@PathVariable("rno") Long rno){
		
		log.info("remove............"+rno);
		
		int removeCount = service.passSelfIntroduct_Remove(rno);
		return removeCount == 1?
				new ResponseEntity<String>("댓글을 삭제했습니다", HttpStatus.OK)
				:new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@DeleteMapping(value ="/WorryQnA/{rno}",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> worryQnA_Remove(@PathVariable("rno") Long rno){
		log.info("remove............"+rno);
		
		int removeCount = service.worryQnA_Remove(rno);
		return removeCount == 1?
				new ResponseEntity<String>("댓글을 삭제했습니다", HttpStatus.OK)
				: new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	//댓글 1건 수정
	//기존의 정보를 수정하는 것이므로 RequestMapping으로 사용 (put, patch)
	//PutMapping : 기존의 정보를 수정
	//PatchMapping : 일부 정보를 수정
	@RequestMapping(value ="/CompanyVal/{rno}",
			method = {RequestMethod.PUT, RequestMethod.PATCH},
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> companyVal_Modify(@RequestBody ReplyVO vo,
			@PathVariable("rno") Long rno){
		
		vo.setRno(rno);
		
		log.info("modify......."+rno);
		log.info("modify........"+vo);
		
		int modifyCount = service.companyVal_Reply_TB_Modify(vo);
		
		log.info("modifyCount........."+modifyCount);
		
		return modifyCount == 1?
				new ResponseEntity<String>("댓글을 수정했습니다", HttpStatus.OK)
			   :new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value ="/InterviewAns/{rno}",
			method = {RequestMethod.PUT, RequestMethod.PATCH},
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> interviewAns_Modify(@RequestBody ReplyVO vo,
			@PathVariable("rno") Long rno){
		
		vo.setRno(rno);
		
		log.info("modify......."+rno);
		log.info("modify........"+vo);
		
		int modifyCount = service.interviewAns_Reply_TB_Modify(vo);
		
		log.info("modifyCount........."+modifyCount);
		
		return modifyCount == 1?
				new ResponseEntity<String>("댓글을 수정했습니다", HttpStatus.OK)
				:new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value ="/Passlatter/{rno}",
			method = {RequestMethod.PUT, RequestMethod.PATCH},
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> passLatter_Modify(@RequestBody ReplyVO vo,
			@PathVariable("rno") Long rno){
		
		vo.setRno(rno);
		
		log.info("modify......."+rno);
		log.info("modify........"+vo);
		
		int modifyCount = service.passLatter_Reply_TB_Modify(vo);
		
		log.info("modifyCount........."+modifyCount);
		
		return modifyCount == 1?
				new ResponseEntity<String>("댓글을 수정했습니다", HttpStatus.OK)
				:new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value ="/PassSelfIntroduct/{rno}",
			method = {RequestMethod.PUT, RequestMethod.PATCH},
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> passSelfIntroduct_Modify(@RequestBody ReplyVO vo,
			@PathVariable("rno") Long rno){
		
		vo.setRno(rno);
		
		log.info("modify......."+rno);
		log.info("modify........"+vo);
		
		int modifyCount = service.passSelfIntroduct_Reply_TB_Modify(vo);
		
		log.info("modifyCount........."+modifyCount);
		
		return modifyCount == 1?
				new ResponseEntity<String>("댓글을 수정했습니다", HttpStatus.OK)
				:new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value ="/WorryQnA/{rno}",
			method = {RequestMethod.PUT, RequestMethod.PATCH},
			consumes = "application/json",
			produces = {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> worryQnA_Modify(@RequestBody ReplyVO vo,
			@PathVariable("rno") Long rno){
		
		vo.setRno(rno);
		
		log.info("modify......."+rno);
		log.info("modify........"+vo);
		
		int modifyCount = service.worryQnA_Reply_TB_Modify(vo);
		
		log.info("modifyCount........."+modifyCount);
		
		return modifyCount == 1?
				new ResponseEntity<String>("댓글을 수정했습니다", HttpStatus.OK)
				:new ResponseEntity<String>("fail", HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
