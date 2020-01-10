package com.naver.erp;

public class MenuSearchDTO {
	
	private String user_id;
	private String keyword;
	private int menu_no;
	private String business_name;
	private String main_category_name;
	private String mid_category_name;
	private String sub_category_name;
	private String menu_name;
	private int menu_price;
	private int menu_cost;
	private int menu_avail; 
	private String menu_using;
	private int selectPageNo=1;
	private int rowCntPerPage=10;
	private String[] chooseBusinessNo;
	private String chooseAllBusinessNo;
	private String sort="2 asc";
	
	
	
	
	public int getMenu_avail() {
		return menu_avail;
	}
	public void setMenu_avail(int menu_avail) {
		this.menu_avail = menu_avail;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getMenu_no() {
		return menu_no;
	}
	public void setMenu_no(int menu_no) {
		this.menu_no = menu_no;
	}
	public String getBusiness_name() {
		return business_name;
	}
	public void setBusiness_name(String business_name) {
		this.business_name = business_name;
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
	public String getMenu_using() {
		return menu_using;
	}
	public void setMenu_using(String menu_using) {
		this.menu_using = menu_using;
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
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	
	
	


}

