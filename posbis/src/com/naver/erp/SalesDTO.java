package com.naver.erp;

import java.util.List;
import java.util.Map;

public class SalesDTO {
	private int salesListAllCnt;
	private List<Map<String,String>> salesList;
	private String[] chooseBusinessNo;
	

	public int getSalesListAllCnt() {
		return salesListAllCnt;
	}
	public void setSalesListAllCnt(int salesListAllCnt) {
		this.salesListAllCnt = salesListAllCnt;
	}
	public List<Map<String, String>> getSalesList() {
		return salesList;
	}
	public void setSalesList(List<Map<String, String>> salesList) {
		this.salesList = salesList;
	}
	public String[] getChooseBusinessNo() {
		return chooseBusinessNo;
	}
	public void setChooseBusinessNo(String[] chooseBusinessNo) {
		this.chooseBusinessNo = chooseBusinessNo;
	}
	
	
	
}
