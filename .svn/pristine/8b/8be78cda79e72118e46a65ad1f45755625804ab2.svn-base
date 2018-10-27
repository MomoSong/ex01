package org.zerock.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {

	// 저장 경로를 받아서 저장경로\년\월\일
	// c:\\zzz\\upload\2018\06\07
	// uploadPath -> 저장 기본 폴더 : c:\\zzz\\upload
	// path -> 날짜 폴더 : \2018\06\07
	public static String calcPath(String uploadPath) {
		// 오늘 날짜 만들기 : new Date(), Calendar.getInstance()
		Calendar cal = Calendar.getInstance();
		// 날짜  패스에 년을 붙인다. File.separator:\\+2018
		String path = File.separator+cal.get(Calendar.YEAR);
		// 월 패스를 2자로(0~11) --> \2018\06
		path = path+File.separator
			// 가져온 월 데이터가 1~9:한자리, 10,11,12은 2자리 이므로 모두 2자리로 맞춰주자 : 00
			+new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		// 일 패스를 2자로(1~31) --> \2018\06\07
		path = path+File.separator
				// 가져온 월 데이터가 1~9:한자리, 10~31은 2자리 이므로 모두 2자리로 맞춰주자 : 00
				+new DecimalFormat("00").format(cal.get(Calendar.DATE));
		System.out.println(path);
		
		//폴더가 없으면 만들자. File(기본폴더 + 날짜폴더)
		File dirPath = new File(uploadPath + path);
		// mkdir() : 마지막에 있는 폴더를 만든다. 만약에 앞에 폴더가 존재하지 않으면 Exception
		// mkdirs(): 모든 폴더에 대해서 존재하지 않으면 만든다.
		if(!dirPath.exists()) dirPath.mkdirs();
		
		// 날짜 폴더 이름만 리턴
		return path;
	}
	
	// 이미지 파일인 경우 크기를 조절하는 프로그램을 이용해서 썸네일 파일을 작성한다.
	// 교재 makeThumbnail(기본폴더, 날짜폴더, 서버에 저장된 파일이름)
	private  static String makeThumbnail
	(String uploadPath, String path, String fileName)
	throws Exception{
		BufferedImage sourceImg 
		= ImageIO.read(new File(uploadPath + path, fileName));
		
		// Scalr.resize(소스이미지 객체, 자동 조정 방식, 높이를 기준으로, 100px로 맞춤)
		BufferedImage destImag = Scalr.resize
				(sourceImg, Scalr.Method.AUTOMATIC,
						Scalr.Mode.FIT_TO_HEIGHT, 100);
		
		// 작은 이미지 파일명 작성 -> String
		String thumbnailName 
		= uploadPath + path+File.separator+"s_"+fileName;
		// 이미지 파일의 타입을 저장 -> 실제적으로 이미지 파일로 저장할 때 넣어준다.
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		// 파일 객체 생성
		File newFile = new File(thumbnailName);
		
		// 읽어온 파일을 새로 만들어지 이미지 파일로 밀어 넣는다.
		ImageIO.write(destImag, formatName.toUpperCase(), newFile);
		
		return (path+File.separator+"s_"+fileName)
				.replace(File.separatorChar, '/');
	}
	
	// 중복이되지 않는 파일명을 만들고 정해진 폴더에 저장하는 프로그램
	// UploadFileUtils.uploadFile(기본폴더, 원래 파일명, 서버로 전달되 파일의 바이트배열)
	public static String uploadFile
	(String uploadPath, String originalName, byte[] fileData)
	throws Exception{
		// 중복이 되지 않도록 중복이 되지 않는 문자열을 만들자.
		UUID uid = UUID.randomUUID();
		// 중복되지 않은 문자열 + "_" + 파일명
		String savedName = uid.toString()+"_"+originalName;
		
		// 년/월/일 경로를 추가해서 붙이기 위해서 날짜 폴더 구하기(없으면 만들어준다.)
		String savedPath = calcPath(uploadPath); // 날짜 폴더
		
		// 하드디스크에 저장할 파일객체 생성
		File target = new File(uploadPath+savedPath, savedName);
		// 실제적으로 파일을 저장한다.
		FileCopyUtils.copy(fileData, target);
		
		// 파일 확장명을 알아내는 프로그램 작성
		String formatName 
		= originalName.substring(originalName.lastIndexOf(".")+1);
		
		// upload된 파일명 정의
		String uploadFileName = null;
		
		System.out.println(formatName);
		// 이미지 파일에 대한 처리 - 이미지인지 알아봐야한다.
		if(MediaUtils.getMediaType(formatName) !=null) { // 이미지
			// 썸네일 파일을 만들고 s_가 붙은 파일명이 나온다.
			uploadFileName 
			= makeThumbnail(uploadPath, savedPath, savedName);
		} else { // 이미지 아님
			uploadFileName = makeIcon(savedPath, savedName);
		}
		
		// 실제적으로 저장된 파일명을 돌려준다. -> db에 저장한다.
		return uploadFileName;
	}
	
	// 이미지 파일이 아닌 경우 - 날짜폴더 + UUID가 파일이름
	private static String makeIcon(
			String path, String fileName) throws Exception{
		return (path + File.separator+fileName)
				.replace(File.separatorChar, '/');
	}
	
}
