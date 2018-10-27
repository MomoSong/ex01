package org.zerock.controller;

import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.util.MediaUtils;

@Controller
public class UtilController {

	// servlet-context.xml에 선언한 bean을 사용한다.
	@Resource(name="uploadPath")
	private String uploadPath;
	
//	private String uploadPath = "c:\\zzz\\upload";

	@ResponseBody
	@RequestMapping("/displayFile")
	//  /localhost/displayFile?filename=~~~
	public ResponseEntity<byte[]> displyFile(String filename)
			throws Exception{
		System.out.println
		(getClass().getSimpleName()+"displayFile().filename");
		
		// 파일을 읽어 올때 사용하는 객체
		InputStream in = null;
		
		// 이미지 인지 알아내는 프로그램: 이미지 -> img tag, 이미지 아니면 -> a tag를 사용(다운)
		String formatName 
		= filename.substring(filename.lastIndexOf(".")+1);
		MediaType mType = MediaUtils.getMediaType(formatName);
		
		//http를 이용해서 파일의 정보를 확인할 수 있는 데이터 : Header
		HttpHeaders headers = new HttpHeaders();
		
		// 서버의 임의 컴퓨터 안에 파일로 저장된 것을 파일 입력 객체 연결
		in= new FileInputStream(uploadPath+filename);
		
		// 이미지 인지 아닌지 처리하는 프로그램
		// 만약에 이미지 이면 이미지 타입정보를 헤더에 넣어 준다.
		if(mType != null) headers.setContentType(mType);
		// 만약에 이미지 파일이 아니면
		else {
			// 원래의 파일명을 구한다.
			filename = filename.substring(filename.indexOf("_")+1);
			// 헤더에 다운로드하는 파일로 셋팅
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			// 원래의 파일명을 헤더에 붙인다. tomcat(ISO-8859-1) http(utf-8)
			headers.add("Content-DisPosition",
					"attachment; filename=\""
					+new String(filename.getBytes("UTF-8"),"ISO-8859-1")
					+"\"");
		}
		
		ResponseEntity<byte[]> entity 
		= new ResponseEntity<byte[]>(IOUtils.toByteArray(in),
				headers, HttpStatus.CREATED);
		in.close();
		return entity;
	}
}
