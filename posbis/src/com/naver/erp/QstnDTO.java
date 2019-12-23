package com.naver.erp;

public class QstnDTO {
	private int qna_no;
	private String subject;
	private int u_no;
	private String qna_date;
	private int readcount;
	private String qna_pwd;
	private String content;
	private int group_no; 
	private int print_no; 
	private int print_level;
	private String user_id;
	private String writer;
	
	
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public String getQna_date() {
		return qna_date;
	}
	public void setQna_date(String qna_date) {
		this.qna_date = qna_date;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getQna_pwd() {
		return qna_pwd;
	}
	public void setQna_pwd(String qna_pwd) {
		this.qna_pwd = qna_pwd;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getGroup_no() {
		return group_no;
	}
	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}
	public int getPrint_no() {
		return print_no;
	}
	public void setPrint_no(int print_no) {
		this.print_no = print_no;
	}
	public int getPrint_level() {
		return print_level;
	}
	public void setPrint_level(int print_level) {
		this.print_level = print_level;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	
}
