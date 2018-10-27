package org.zerock.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.board.dto.Criteria;
import org.zerock.board.dto.ReplyDTO;
import org.zerock.board.service.ReplyService;

@RestController
@RequestMapping("/replies/")
public class RestReplyController {

	@Inject
	private ReplyService service;
	
	// 댓글 리스트
	// /replies/all?no=1 ==> /replies/all/1
//	@RequestMapping(value="/all/{no}", method=RequestMethod.GET)
	// replies/no/page
	@RequestMapping(value="/{no}/{page}", method=RequestMethod.GET)
//	public ResponseEntity<List<ReplyDTO>> 
	public ResponseEntity<Map<String, Object>> 
	list(@PathVariable("no") Integer no,@PathVariable("page") Integer page
			){
		ResponseEntity<Map<String, Object>> entity = null;
		Map<String, Object> map = new HashMap<>();
		// 페이지 처리를 위한 Criteria
		Criteria cri = new Criteria();
		cri.setPage(page);
		try {
			// 총 댓글의 갯수
			cri.setTotalCount(service.getTotalRow(no));
			// 페이지 처리를 위한 계산 처리
			cri.calcData();
			System.out.println(cri);
			map.put("cri", cri);
			map.put("list", service.list(no,cri));
			entity = new ResponseEntity<>(map, HttpStatus.OK);
			
		}catch (Exception e) {
			// TODO: handle exception
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 댓글 쓰기
	//  /replies/
	@RequestMapping(value="/", method = RequestMethod.POST)
	public ResponseEntity<String> write(@RequestBody ReplyDTO dto){
		System.out.println(getClass().getSimpleName()+".write()");
		System.out.println(dto);
		ResponseEntity<String> entity = null;
		// service dto 데이터를 전달.
		try {
			service.write(dto);
			entity=new ResponseEntity<String>("WRITE OK", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>
			(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	// 댓글 수정
	//  /replies/
	@RequestMapping(value="/{rno}",
			method = {RequestMethod.PUT, RequestMethod.PATCH})
	public ResponseEntity<String> update(
			@PathVariable("rno") int rno,
			@RequestBody ReplyDTO dto){
		System.out.println(getClass().getSimpleName()+".update()");
		dto.setRno(rno);
		System.out.println(dto);
		ResponseEntity<String> entity = null;
		// service dto 데이터를 전달.
		try {
			service.update(dto);
			entity=new ResponseEntity<String>("UPDATE OK", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>
			(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	// 댓글 삭제
	//  /replies/
	@RequestMapping(value="/{rno}",
			method = RequestMethod.DELETE)
	public ResponseEntity<String> delete(
			@PathVariable("rno") int rno){
		System.out.println(getClass().getSimpleName()+".delete()");
		ResponseEntity<String> entity = null;
		// service rno 데이터를 전달.
		try {
			service.delete(rno);
			entity=new ResponseEntity<String>("DELETE OK", HttpStatus.OK);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			entity = new ResponseEntity<String>
			(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
