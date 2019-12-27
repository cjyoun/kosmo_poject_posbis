package com.naver.erp;

public class PreSearchDTO {
	
	private int rnum=0;
	private int u_no =7;
	private String business_no;
	private String business_type_name1;
	private String business_type_name2;
	private String addr_gu1;
	private int month_sales=0;
	private int selectPageNo=1;
	private int rowCntPerPage=10;
	private String sort="rnum asc";
	
	
	
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public int getU_no() {
		return u_no;
	}
	public void setU_no(int u_no) {
		this.u_no = u_no;
	}
	public String getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}
	public String getBusiness_type_name1() {
		return business_type_name1;
	}
	public void setBusiness_type_name1(String business_type_name1) {
		this.business_type_name1 = business_type_name1;
	}
	public String getBusiness_type_name2() {
		return business_type_name2;
	}
	public void setBusiness_type_name2(String business_type_name2) {
		this.business_type_name2 = business_type_name2;
	}
	public String getAddr_gu1() {
		return addr_gu1;
	}
	public void setAddr_gu1(String addr_gu1) {
		this.addr_gu1 = addr_gu1;
	}
	public int getMonth_sales() {
		return month_sales;
	}
	public void setMonth_sales(int month_sales) {
		this.month_sales = month_sales;
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
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	
	
	
	
		
	
	
	
	
	

}