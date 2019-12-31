package com.naver.erp;

public class MenuSalesSearchDTO {
	private String user_id;
	private String keyword;
	private String sales_date;
	private String sales_date_t1;
	private String sales_date_t2;
	private int selectPageNo=1;
	private int menuRowCntPerPage=10;
	private String[] chooseBusinessNo;
	private String chooseAllBusinessNo;
	private String sort="s.menu_name asc";
	
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
	public String getSales_date_t1() {
		return sales_date_t1;
	}
	public void setSales_date_t1(String sales_date_t1) {
		this.sales_date_t1 = sales_date_t1;
	}
	public String getSales_date_t2() {
		return sales_date_t2;
	}
	public void setSales_date_t2(String sales_date_t2) {
		this.sales_date_t2 = sales_date_t2;
	}
	public String getSales_date() {
		return sales_date;
	}
	public void setSales_date(String sales_date) {
		this.sales_date = sales_date;
	}
	public int getSelectPageNo() {
		return selectPageNo;
	}
	public void setSelectPageNo(int selectPageNo) {
		this.selectPageNo = selectPageNo;
	}
	public int getMenuRowCntPerPage() {
		return menuRowCntPerPage;
	}
	public void setMenuRowCntPerPage(int menuRowCntPerPage) {
		this.menuRowCntPerPage = menuRowCntPerPage;
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
