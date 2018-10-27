package org.zerock.data.dto;

import java.util.Date;

import org.zerock.util.MediaUtils;

public class AttachFile {
	private int fno, no;
	private String fileName;
	private Date regDate;
	private boolean image; // 이미지 인지 확인하기 위해
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
		if(MediaUtils.getMediaType
		(fileName.substring(fileName.lastIndexOf(".")+1))!=null)
			image = true;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public boolean isImage() {
		return image;
	}
	public void setImage(boolean image) {
		this.image = image;
	}
	
	@Override
	public String toString() {
		return "AttachFile [fno=" + fno + ", no=" + no + ", fileName=" + fileName + ", regDate=" + regDate + ", image="
				+ image + "]";
	}
	
	
	
}
