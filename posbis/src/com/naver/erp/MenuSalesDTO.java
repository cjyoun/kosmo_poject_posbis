package com.naver.erp;

import java.util.List;
import java.util.Map;

public class MenuSalesDTO {
	private int menuSalesListAllCnt;
	private List<Map<String,String>> menuSalesList;
	private String[] chooseBusinessNo;
	
	
	public int getMenuSalesListAllCnt() {
		return menuSalesListAllCnt;
	}
	public void setMenuSalesListAllCnt(int menuSalesListAllCnt) {
		this.menuSalesListAllCnt = menuSalesListAllCnt;
	}
	public List<Map<String, String>> getMenuSalesList() {
		return menuSalesList;
	}
	public void setMenuSalesList(List<Map<String, String>> menuSalesList) {
		this.menuSalesList = menuSalesList;
	}
	public String[] getChooseBusinessNo() {
		return chooseBusinessNo;
	}
	public void setChooseBusinessNo(String[] chooseBusinessNo) {
		this.chooseBusinessNo = chooseBusinessNo;
	}
	
}
