package com.naver.erp;

public class WithdrawalDTO {

	//탈퇴 데이터를 받기 위한 DTO
	//joinDTO에는 int u_no가 있기때문에 받아오는 데이터가 없으면 int에는 에러가 난다
	
	private String user_id;
	private String user_pwd;
	private int u_no;
	
	
	
	
	
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
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
	
	
}
