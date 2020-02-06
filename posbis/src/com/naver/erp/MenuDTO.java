package com.naver.erp;

import java.util.List;
import java.util.Map;

public class MenuDTO {
	
	private int menu_no;
    private String business_no="";
    private String menu_name="";
    private int menu_price;
    private int menu_cost;
    private String menu_category_code="";
    private String main_category_name="";
    private String mid_category_name="";
    private String sub_category_name="";
    private String business_name="";
    private String menu_using="";
    private int menuListAllCnt;
    private List<Map<String,String>> menuList;
    private String[] chooseBusinessNo;
	
	
	
	
	
	public int getMenuListAllCnt() {
		return menuListAllCnt;
	}
	public void setMenuListAllCnt(int menuListAllCnt) {
		this.menuListAllCnt = menuListAllCnt;
	}
	public List<Map<String, String>> getMenuList() {
		return menuList;
	}
	public void setMenuList(List<Map<String, String>> menuList) {
		this.menuList = menuList;
	}
	public String[] getChooseBusinessNo() {
		return chooseBusinessNo;
	}
	public void setChooseBusinessNo(String[] chooseBusinessNo) {
		this.chooseBusinessNo = chooseBusinessNo;
	}
	public String getMenu_using() {
		return menu_using;
	}
	public void setMenu_using(String menu_using) {
		this.menu_using = menu_using;
	}
	public String getBusiness_name() {
		return business_name;
	}
	public void setBusiness_name(String business_name) {
		this.business_name = business_name;
	}
	public int getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}
	public String getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}

	/*
	 * public int getU_no() { return u_no; } public void setU_no(int u_no) {
	 * this.u_no = u_no; }
	 */
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
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
	public String getMenu_category_code() {
		return menu_category_code;
	}
	public void setMenu_category_code(String menu_category_code) {
		this.menu_category_code = menu_category_code;
	}
	
	

	
	
}