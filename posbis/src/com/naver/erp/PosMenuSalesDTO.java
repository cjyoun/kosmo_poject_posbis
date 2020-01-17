package com.naver.erp;

import java.util.List;
import java.util.Map;

public class PosMenuSalesDTO {

	private String[] menu_name;
	
	private int[] sales_count=null;
	
	private String business_no;
	
	private String menu_name1;
	
	private int sales_count1=0;
	
 

	public String[] getMenu_name() {
		return menu_name;
	}

	public void setMenu_name(String[] menu_name) {
		this.menu_name = menu_name;
	}

	public int[] getSales_count() {
		return sales_count;
	}

	public void setSales_count(int[] sales_count) {
		this.sales_count = sales_count;
	}

	public String getBusiness_no() {
		return business_no;
	}

	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}

	public String getMenu_name1() {
		return menu_name1;
	}

	public void setMenu_name1(String menu_name1) {
		this.menu_name1 = menu_name1;
	}

	public int getSales_count1() {
		return sales_count1;
	}

	public void setSales_count1(int sales_count1) {
		this.sales_count1 = sales_count1;
	}

 

	 
	
}
