package com.naver.erp;

public class SearchIDPwdDTO {
	
	private String user_id;
	private String user_pwd;
	private String user_name;
	private String business_no;
	
	private int question_code=0;
	private String answer;
	
	
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}
	public int getQuestion_code() {
		return question_code;
	}
	public void setQuestion_code(int question_code) {
		this.question_code = question_code;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	

	
}
