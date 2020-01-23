package com.naver.erp;

public class ResManagerDTO {
	
	
	private int r_no;
	private String user_id;
	private String res_date;
	private String res_time;
	private String business_no;
	private int month;
	private String title;
	private int start;
	private String[] chooseBusinessNo;
	private String chooseAllBusinessNo;
	
	
	
	
	public String getRes_time() {
		return res_time;
	}
	public void setRes_time(String res_time) {
		this.res_time = res_time;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getRes_date() {
		return res_date;
	}
	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}
	public String[] getChooseBusinessNo() {
		return chooseBusinessNo;
	}
	public void setChooseBusinessNo(String[] chooseBusinessNo) {
		this.chooseBusinessNo = chooseBusinessNo;
	}
	public String getChooseAllBusinessNo() {
		return chooseAllBusinessNo;
	}
	public void setChooseAllBusinessNo(String chooseAllBusinessNo) {
		this.chooseAllBusinessNo = chooseAllBusinessNo;
	}

	
}
