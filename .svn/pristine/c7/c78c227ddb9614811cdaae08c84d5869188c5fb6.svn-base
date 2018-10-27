package org.zerock.interceptor;

import org.springframework.data.annotation.Id;

public class LogCount {

	@Id
	private String part;
	// mapReduce에 의해 리턴되는 결과값을 받을 때 변수이름이 value로 받는다.
	private int value;
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public int getValue() {
		return value;
	}
	public void setValue(int value) {
		this.value = value;
	}
	@Override
	public String toString() {
		return "LogCount [part=" + part + ", value=" + value + "]";
	}
	
}
