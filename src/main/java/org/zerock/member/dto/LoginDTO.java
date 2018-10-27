package org.zerock.member.dto;

public class LoginDTO {

	private String id;
	private String name;
	private int point;
	private int gno;
	private String gname;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getGno() {
		return gno;
	}
	public void setGno(int gno) {
		this.gno = gno;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	@Override
	public String toString() {
		return "LoginDTO [id=" + id + ", name=" + name + ", point=" + point + ", gno=" + gno + ", gname=" + gname + "]";
	}
	
	
	
}
