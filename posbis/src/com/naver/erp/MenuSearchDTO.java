package com.naver.erp;

public class MenuSearchDTO {
	
	private String keyword;
	private String main_category_name;
	private String mid_category_name;
	private String sub_category_name;
	private String menu_name;
	private int menu_no;
	private int menu_price;
	private int menu_cost;
	private String business_no;
	private int selectPageNo=1;
	private int rowCntPerPage=15;
	private String changeBusinessNo;
	private String user_id;
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getChangeBusinessNo() {
		return changeBusinessNo;
	}
	public void setChangeBusinessNo(String changeBusinessNo) {
		this.changeBusinessNo = changeBusinessNo;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getMain_category_name() {
		return main_category_name;
	}
	public void setMain_category_name(String main_category_name) {
		this.main_category_name = main_category_name;
	}
	public String getMid_category_name() {
		return mid_category_name;
	}
	public void setMid_category_name(String mid_category_name) {
		this.mid_category_name = mid_category_name;
	}
	public String getSub_category_name() {
		return sub_category_name;
	}
	public void setSub_category_name(String sub_category_name) {
		this.sub_category_name = sub_category_name;
	}
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}
	public int getMenu_price() {
		return menu_price;
	}
	public void setMenu_price(int menu_price) {
		this.menu_price = menu_price;
	}
	public int getMenu_cost() {
		return menu_cost;
	}
	public void setMenu_cost(int menu_cost) {
		this.menu_cost = menu_cost;
	}
	public String getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}
	public int getSelectPageNo() {
		return selectPageNo;
	}
	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}
	public int getRowCntPerPage() {
		return rowCntPerPage;
	}
	public void setRowCntPerPage(int rowCntPerPage) {
		this.rowCntPerPage = rowCntPerPage;
	}
	
}

