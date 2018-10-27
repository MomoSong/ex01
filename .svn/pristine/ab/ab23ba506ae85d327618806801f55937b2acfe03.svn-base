package org.zerock.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class RestSampleController {

	// DTO 객체를 클라이언트에 넘기면 jackson 라이브러리가 등록되어 있을 때 json데이터로 넘기기
	@RequestMapping(value="/sendDTO")
	@ResponseBody
	public SampleDTO sendDTO() {
		SampleDTO dto = new SampleDTO();
		dto.setMno(1);
		dto.setFirstName("영환");
		dto.setLastName("이");
		return dto;
	}
	
	// List 객체를 클라이언트에 넘기면 jackson 라이브러리가 등록되어 있을 때 json데이터로 넘기기
	@RequestMapping(value="/sendList")
	@ResponseBody
	public List<SampleDTO> sendList() {
		List<SampleDTO> list = new ArrayList<>();
		for(int i = 1; i <= 10; i++) {
			SampleDTO dto = new SampleDTO();
			dto.setMno(1);
			dto.setFirstName("영환");
			dto.setLastName("이");
			list.add(dto);
		}
		return list;
	}
	
	// Map 객체를 클라이언트에 넘기면 jackson 라이브러리가 등록되어 있을 때 json데이터로 넘기기
	@RequestMapping(value="/sendMap")
	@ResponseBody
	public Map<String, Object> sendMap() {
		Map<String, Object> map = new HashMap<>();
		map.put("mno", 1);
		map.put("firstName", "영환");
		map.put("lastName", "이");
		return map;
	}
	
	// Map 객체를 클라이언트에 넘기면 jackson 라이브러리가 등록되어 있을 때 json데이터로 넘기기
	@RequestMapping(value="/sendMapDTO")
	@ResponseBody
	public Map<Integer, SampleDTO> sendMapDTO() {
		Map<Integer, SampleDTO> map = new HashMap<>();
		for(int i = 1; i <=10; i++) {
			SampleDTO dto = new SampleDTO();
			dto.setMno(i);
			dto.setFirstName("종범");
			dto.setLastName("최");
			map.put(i,dto);
		}
		return map;
	}
	
}
