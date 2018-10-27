package org.zerock.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;

public class MediaUtils {

	private static Map<String, MediaType> mediaMap;
	
	// static 초기화 블록 - 자바가 실행이 될때 바로 실행이 되는 부분
	static {
		// 이미지 미디어 값을 확장명으로 꺼내면 미디어 이미지 타입이 나온다. 
		mediaMap = new HashMap<>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	
	// 확장명을 가지고 문자열로 넣으면 그에 따른 미디어 이미지 타입이 나오게 하는 메서드
	public static MediaType getMediaType(String type) {
		return mediaMap.get(type.toUpperCase());
	}
	
}