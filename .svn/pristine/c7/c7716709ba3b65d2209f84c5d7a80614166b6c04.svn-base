package org.zerock.data.dto;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class DataDTO {

	private int no;
	private String title;
	private String content;
	private String writer;
	private Date writeDate;
	private int hit;
	private int filecnt;
	
	// 첨부파일 하나를 받는 변수
	private MultipartFile file1;
	
	// 첨부파일명을 저장하는 변수
	private String savedFile;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getFilecnt() {
		return filecnt;
	}
	public void setFilecnt(int filecnt) {
		this.filecnt = filecnt;
	}
	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public String getSavedFile() {
		return savedFile;
	}
	public void setSavedFile(String savedFile) {
		this.savedFile = savedFile;
	}
	@Override
	public String toString() {
		return "DataDTO [no=" + no + ", title=" + title + ", content=" + content + ", writer=" + writer + ", writeDate="
				+ writeDate + ", hit=" + hit + ", filecnt=" + filecnt 
				+ ", file1=" + file1.getOriginalFilename() + ", savedFile=" + savedFile
				+ "]";
	}
	
}
