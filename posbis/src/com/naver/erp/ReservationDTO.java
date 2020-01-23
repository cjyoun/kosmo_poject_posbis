package com.naver.erp;

import java.util.List;
import java.util.Map;

public class ReservationDTO {
	
	private int r_no;
	private String user_id;
	private String business_no;
	private String res_name;
	private String res_date;
	private String res_time;
	private int res_guest;
	private String res_phone;
	private String res_text;
	private int month;
	private int title;
	private String start;
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
	public int getR_no() {
		return r_no;
	}
	public void setR_no(int r_no) {
		this.r_no = r_no;
	}
	public String getRes_phone() {
		return res_phone;
	}
	public void setRes_phone(String res_phone) {
		this.res_phone = res_phone;
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
	public String getRes_name() {
		return res_name;
	}
	public void setRes_name(String res_name) {
		this.res_name = res_name;
	}
	public String getRes_date() {
		return res_date;
	}
	public void setRes_date(String res_date) {
		this.res_date = res_date;
	}
	public int getRes_guest() {
		return res_guest;
	}
	public void setRes_guest(int res_guest) {
		this.res_guest = res_guest;
	}
	public String getRes_text() {
		return res_text;
	}
	public void setRes_text(String res_text) {
		this.res_text = res_text;
	}
	public String getRes_time() {
		return res_time;
	}
	public void setRes_time(String res_time) {
		this.res_time = res_time;
	}
	
	

	
}