package com.naver.erp;

import java.util.List;
import java.util.Map;

public class ResCntDTO {
	
	private int month=0;
	private int title=0;
	private String start;
	private String business_no;
	private String user_id;
	private String[] chooseBusinessNo;
	private String chooseAllBusinessNo;

	
	
	
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
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getTitle() {
		return title;
	}
	public void setTitle(int title) {
		this.title = title;
	}
	public String getStart() {
		return start;
	}
	public void setStart(String start) {
		this.start = start;
	}
	

	
}